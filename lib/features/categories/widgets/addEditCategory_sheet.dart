import 'dart:convert';

import 'package:expensetracker/core/constants/iconData_constants.dart';
import 'package:expensetracker/core/constants/priority_contants.dart';
import 'package:expensetracker/core/custom_widgets/customButton_widget.dart';
import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
import 'package:expensetracker/core/custom_widgets/loader.dart';
import 'package:expensetracker/core/error_handling/error_text.dart';
import 'package:expensetracker/core/utils/global_functions.dart';
import 'package:expensetracker/features/categories/controller/category_controller.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/features/categories/providers/categoryIconList_provider.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddEditCategorySheet extends ConsumerStatefulWidget {
  final CategoryViewModel? categoryViewModel;
  const AddEditCategorySheet({super.key, required this.categoryViewModel});

  @override
  ConsumerState<AddEditCategorySheet> createState() =>
      _AddEditCategorySheetState();
}

class _AddEditCategorySheetState extends ConsumerState<AddEditCategorySheet> {
  final TextEditingController categoryNameController = TextEditingController();
  final pickedIconProvider = StateProvider<IconDataModel?>((ref) => null);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.categoryViewModel != null) {
      final categoryViewModel = widget.categoryViewModel!;
      categoryNameController.text = categoryViewModel.category.categoryName;
      WidgetsBinding.instance.addPostFrameCallback(
        (timeStamp) {
          ref.read(pickedIconProvider.notifier).update((state) {
            return categoryViewModel.icon;
          });
        },
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.w,
                  height: 5.h,
                  margin: EdgeInsets.only(bottom: 8.h),
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Text(
                  widget.categoryViewModel != null
                      ? "Add a Category"
                      : "Edit Category",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  controller: categoryNameController,
                  labelText: "Category Name",
                  hintText: "Movie, Food, Travel etc.",
                ),
                Container(
                  height: 300.h,
                  margin: EdgeInsets.only(top: 20.h),
                  child: Consumer(
                    builder: (context, ref, child) {
                      final asyncValue = ref.watch(categoryIconListProvider);
                      return asyncValue.when(
                        data: (iconList) {
                          if (iconList.isEmpty) {
                            return const Center(
                              child: Text("No icons found"),
                            );
                          }
                          final iconCategoryList = iconList
                              .map((e) {
                                return e.iconCategory;
                              })
                              .toSet()
                              .toList();
                          return ListView.builder(
                            itemCount: iconCategoryList.length,
                            itemBuilder: (context, index) {
                              final iconPickCategory = iconCategoryList[index];
                              final iconListFiltered = iconList
                                  .where((element) =>
                                      element.iconCategory == iconPickCategory)
                                  .toList();
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    iconPickCategory,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 5,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                    itemCount: iconListFiltered.length,
                                    itemBuilder: (context, gridIndex) {
                                      final iconData =
                                          iconListFiltered[gridIndex];
                                      return Consumer(
                                        builder: (context, ref, child) {
                                          final pickedIcon =
                                              ref.watch(pickedIconProvider);
                                          final isSelected =
                                              pickedIcon == iconData;
                                          return GestureDetector(
                                            onTap: () {
                                              ref
                                                  .read(pickedIconProvider
                                                      .notifier)
                                                  .update((state) => iconData);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? Colors.blue[200]
                                                    : Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(10.r),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    GlobalFunctions.getIconData(
                                                      iconCodePoint: iconData
                                                          .iconCodePoint,
                                                      iconFontFamily: iconData
                                                          .iconFontFamily,
                                                    ),
                                                    size: 20.sp,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Text(
                                                    iconData.name,
                                                    style: TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              );
                            },
                          );
                        },
                        error: (error, stackTrace) {
                          return ErrorText(errorText: error);
                        },
                        loading: () {
                          return const Loader();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      onPressed: () async {
                        context.pop(context);
                      },
                      title: "Close",
                      width: .45.sw,
                      height: 40.h,
                      textStyle: TextStyle(fontSize: 16.sp),
                      borderRadius: 8,
                    ),
                    CustomButton(
                      onPressed: () async {
                        if (widget.categoryViewModel == null) {
                          await addCategory();
                        } else {
                          await editcategory();
                        }
                      },
                      title: widget.categoryViewModel == null ? "Add" : "Edit",
                      width: .45.sw,
                      height: 40.h,
                      textStyle: TextStyle(fontSize: 16.sp),
                      borderRadius: 8,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addCategory() async {
    final pickedIcon = ref.read(pickedIconProvider);

    if (_formKey.currentState!.validate()) {
      final category = CategoryModel(
        categoryName: categoryNameController.text,
        iconId: pickedIcon?.id,
        createdTime: DateTime.now().toIso8601String(),
        updatedTime: DateTime.now().toIso8601String(),
        priority: PriorityConstants.low,
        isActive: 1,
      );
      await ref.read(categoryControllerProvider.notifier).addCategory(
            category: category,
            context: context,
          );
    }
  }

  Future<void> editcategory() async {
    final pickedIcon = ref.read(pickedIconProvider);
    final oldCategoryModel = widget.categoryViewModel!.category;
    final updatedCategoruModel = oldCategoryModel.copyWith(
      categoryName: categoryNameController.text,
      iconId: pickedIcon?.id,
      updatedTime: DateTime.now().toIso8601String(),
    );

    if (_formKey.currentState!.validate()) {
      await ref.read(categoryControllerProvider.notifier).editCategory(
            category: updatedCategoruModel,
            context: context,
          );
    }
  }
}
