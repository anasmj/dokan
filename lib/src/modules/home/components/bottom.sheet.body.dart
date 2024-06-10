import 'package:dokan/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductFilterOptionWidget extends StatelessWidget {
  const ProductFilterOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          FilterCheckbox(
            label: 'Newest',
            selected: false,
            onChanged: () {},
          ),
          FilterCheckbox(
            label: 'Oldest',
            selected: false,
            onChanged: () {},
          ),
          FilterCheckbox(
            label: 'Price low > high',
            selected: false,
            onChanged: () {},
          ),
          FilterCheckbox(
            label: 'Price high > low',
            selected: false,
            onChanged: () {},
          ),
          FilterCheckbox(
            label: 'Best selling',
            selected: false,
            onChanged: () {},
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
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
                    minimumSize: const Size.fromHeight(70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
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
  final VoidCallback? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            activeColor: Colors.pink.shade300,
            value: true,
            onChanged: (v) {},
          ),
        ),
        Text(
          label ?? '',
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
