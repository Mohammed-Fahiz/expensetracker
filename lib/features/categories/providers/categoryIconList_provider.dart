import 'dart:async';

import 'package:expensetracker/features/categories/controller/category_controller.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryIconListProvider = AutoDisposeAsyncNotifierProvider<
    CategoryIconListNotifier, List<IconDataModel>>(
  () => CategoryIconListNotifier(),
);

class CategoryIconListNotifier
    extends AutoDisposeAsyncNotifier<List<IconDataModel>> {
  @override
  FutureOr<List<IconDataModel>> build() {
    return fetchCategories();
  }

  Future<List<IconDataModel>> fetchCategories() async {
    return await ref
        .read(categoryControllerProvider.notifier)
        .fetchCategoryIcons();
  }
}
