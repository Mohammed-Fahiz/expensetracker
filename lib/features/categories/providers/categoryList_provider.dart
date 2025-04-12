import 'dart:async';

import 'package:expensetracker/features/categories/controller/category_controller.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryListProvider = AutoDisposeAsyncNotifierProvider<
    CategoryListNotifier, List<CategoryViewModel>>(
  () => CategoryListNotifier(),
);

class CategoryListNotifier
    extends AutoDisposeAsyncNotifier<List<CategoryViewModel>> {
  List<CategoryViewModel> _orginalState = [];

  @override
  FutureOr<List<CategoryViewModel>> build() {
    return fetchCategories();
  }

  Future<List<CategoryViewModel>> fetchCategories() async {
    final categories =
        await ref.read(categoryControllerProvider.notifier).fetchCategories();
    _orginalState = categories;
    return categories;
  }

  void filterCategories(String query) {
    if (query.isEmpty) {
      state = AsyncValue.data(_orginalState);
    } else {
      final filteredCategories = _orginalState.where((categoryViewModel) {
        return categoryViewModel.category.categoryName
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
      state = AsyncValue.data(filteredCategories);
    }
  }
}
