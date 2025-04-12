import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
import 'package:expensetracker/core/custom_widgets/loader.dart';
import 'package:expensetracker/core/error_handling/error_text.dart';
import 'package:expensetracker/core/utils/formatTime.dart';
import 'package:expensetracker/core/utils/global_functions.dart';
import 'package:expensetracker/features/categories/models/categoryView_model.dart';
import 'package:expensetracker/features/categories/models/category_model.dart';
import 'package:expensetracker/features/categories/providers/categoryList_provider.dart';
import 'package:expensetracker/features/categories/widgets/addEditCategory_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_icons/line_icons.dart';

class ListCategoryScreen extends ConsumerStatefulWidget {
  static const routeName = "/add-category";
  const ListCategoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ListCategoryScreenState();
}

class _ListCategoryScreenState extends ConsumerState<ListCategoryScreen> {
  final TextEditingController categoryNameController = TextEditingController();

  @override
  void dispose() {
    categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        actions: [
          IconButton(
            icon: const Icon(LineIcons.plusCircle),
            onPressed: () {
              addEditCategorySheet(context: context, categoryViewModel: null);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              CustomTextFieldWidget(
                controller: categoryNameController,
                labelText: "Search Category",
                hintText: "Search Category Name",
                onChanged: (value) {
                  ref
                      .read(categoryListProvider.notifier)
                      .filterCategories(value);
                },
              ),
              Consumer(
                builder: (context, ref, child) {
                  final asyncValue = ref.watch(categoryListProvider);
                  return asyncValue.when(
                    data: (categories) {
                      if (categories.isEmpty) {
                        return const Center(
                          child: Text("No categories found"),
                        );
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index].category;
                          final icon = categories[index].icon;
                          final time = FormatTimeFunctions
                              .convertIsoToDateAndTimeFormatted(
                                  isoDate: category.updatedTime);
                          return GestureDetector(
                            onTap: () {
                              addEditCategorySheet(
                                context: context,
                                categoryViewModel: categories[index],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(10.w),
                                child: Row(
                                  children: [
                                    Icon(
                                      GlobalFunctions.getIconData(
                                        iconCodePoint: icon?.iconCodePoint,
                                        iconFontFamily: icon?.iconFontFamily,
                                      ),
                                      size: 30.w,
                                    ),
                                    SizedBox(width: 10.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          category.categoryName,
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Last updated: $time",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) {
                      return ErrorText(errorText: error);
                    },
                    loading: () => const Loader(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addEditCategorySheet({
    required BuildContext context,
    required CategoryViewModel? categoryViewModel,
  }) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return AddEditCategorySheet(
          categoryViewModel: categoryViewModel,
        );
      },
    );
  }
}
