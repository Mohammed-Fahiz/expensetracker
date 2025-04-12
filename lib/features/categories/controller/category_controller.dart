import 'package:expensetracker/core/custom_widgets/custom_snackBar.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/features/categories/providers/categoryList_provider.dart';
import 'package:expensetracker/features/categories/repository/category_repository.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final categoryControllerProvider = NotifierProvider<CategoryController, bool>(
  () => CategoryController(),
);

class CategoryController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<void> addCategory({
    required CategoryModel category,
    required BuildContext context,
  }) async {
    state = true;
    final res = await ref
        .read(categoryRepositoryProvider)
        .addCategory(category: category);
    state = false;
    res.fold(
      (l) {
        //TODO sheet no snackbar show
        showSnackBar(
          content: l.errMSg,
          context: context,
          color: Colors.red,
        );
      },
      (r) {
        context.pop();
        showSnackBar(
          content: "Category added successfully",
          context: context,
          color: Colors.green,
        );
        ref.invalidate(categoryListProvider);
      },
    );
  }

  Future<void> editCategory({
    required CategoryModel category,
    required BuildContext context,
  }) async {
    state = true;
    final res = await ref
        .read(categoryRepositoryProvider)
        .editCategory(category: category);
    state = false;
    res.fold(
      (l) {
        //TODO sheet no snackbar show
        showSnackBar(
          content: l.errMSg,
          context: context,
          color: Colors.red,
        );
      },
      (r) {
        context.pop();
        showSnackBar(
          content: "Category updated successfully",
          context: context,
          color: Colors.green,
        );
        ref.invalidate(categoryListProvider);
      },
    );
  }

  Future<List<CategoryViewModel>> fetchCategories() async {
    final res = await ref.read(categoryRepositoryProvider).fetchCategories();
    return res.fold(
      (l) => throw Exception(l.errMSg),
      (categories) => categories,
    );
  }

  Future<List<IconDataModel>> fetchCategoryIcons() async {
    final res = await ref.read(categoryRepositoryProvider).fetchCategoryIcons();
    return res.fold(
      (l) => throw Exception(l.errMSg),
      (iconDataList) => iconDataList,
    );
  }
}
