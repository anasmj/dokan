import 'package:dokan/src/extensions/extensions.dart';
import 'package:dokan/src/modules/home/providers/filters.provider.dart';
import 'package:dokan/src/modules/home/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class ProductFilterOptionWidget extends ConsumerWidget {
  const ProductFilterOptionWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final filters = ref.watch(filtersProvider);
    final notifier = ref.watch(filtersProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(20),
          Divider(
            indent: context.width * 0.34,
            endIndent: context.width * 0.34,
            color: Colors.pink.shade100,
            thickness: 4,
          ),
          const Gap(20),
          Text(
            'Filter ',
            style: context.text.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(20),
          // ListTile(
          //   title: Text('Newest'),
          //   leading: FilterCheckbox(
          //     // label: 'Newest',
          //     selected: filters.contains(Filter.newwest),
          //     onChanged: (v) {
          //       notifier.onAddFilter(Filter.newwest);
          //     },
          //   ),
          // ),
          FilterCheckbox(
            label: 'Newest',
            selected: filters.contains(Filter.newwest),
            onChanged: (v) {
              notifier.onAddFilter(Filter.newwest);
            },
          ),
          FilterCheckbox(
            label: 'Oldest',
            selected: filters.contains(Filter.oldest),
            onChanged: (v) {
              notifier.onAddFilter(Filter.oldest);
            },
          ),
          FilterCheckbox(
            label: 'Price low > high',
            selected: filters.contains(Filter.priceAscending),
            onChanged: (v) {
              notifier.onAddFilter(Filter.priceAscending);
            },
          ),
          FilterCheckbox(
            label: 'Price high > low',
            selected: filters.contains(Filter.priceDescending),
            onChanged: (v) {
              notifier.onAddFilter(Filter.priceDescending);
            },
          ),
          FilterCheckbox(
            label: 'Best selling',
            selected: filters.contains(Filter.bestSelling),
            onChanged: (v) {
              notifier.onAddFilter(Filter.bestSelling);
            },
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    ref.read(isFilterAppliedProvider.notifier).state = false;
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: FilledButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    minimumSize: const Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    final filters = ref.read(filtersProvider);
                    if (filters.isEmpty) {
                      // ignore: unused_result
                      ref.refresh(productsProvider);
                    } else {}
                    ref.read(productsProvider.notifier).applyFilter(filters);

                    Navigator.pop(context);
                    // ref.read(isFilterAppliedProvider.notifier).state = true;
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox({
    super.key,
    this.label,
    this.selected,
    this.onChanged,
  });
  final String? label;
  final bool? selected;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged!(true),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
            scale: 1.4,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
              side: const BorderSide(color: Colors.pink),
              activeColor: Colors.pink.shade300,
              value: selected,
              onChanged: onChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              label ?? '',
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
