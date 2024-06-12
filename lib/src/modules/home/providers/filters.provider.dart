import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter { newwest, oldest, priceAscending, priceDescending, bestSelling }

final filtersProvider =
    NotifierProvider<FiltersProvider, List<Filter>>(FiltersProvider.new);

class FiltersProvider extends Notifier<List<Filter>> {
  @override
  List<Filter> build() => [];

  void onAddFilter(Filter f) {
    if (state.contains(f)) {
      state = [...state]..remove(f);
    } else {
      state = [...state, f];
    }
    if (f != Filter.bestSelling) _replaceDuplicateWithUpdated(f);
    print(state);
  }

  void _replaceDuplicateWithUpdated(Filter f) {
    ///remove duplicate newest and oldest
    if (state.contains(Filter.newwest) && state.contains(Filter.oldest)) {
      if (f == Filter.newwest) {
        state = [...state]..remove(Filter.oldest);
      } else {
        state = [...state]..remove(Filter.newwest);
      }
    }
    //remove duplicate price sort
    if (state.contains(Filter.priceAscending) &&
        state.contains(Filter.priceDescending)) {
      if (f == Filter.priceAscending) {
        state = [...state]..remove(Filter.priceDescending);
      } else {
        state = [...state]..remove(Filter.priceAscending);
      }
    }
  }
}

final isFilterAppliedProvider = StateProvider((ref) => false);
