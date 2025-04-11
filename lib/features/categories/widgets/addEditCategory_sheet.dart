import 'package:expensetracker/core/constants/iconData_constants.dart';
import 'package:expensetracker/core/custom_widgets/customButton_widget.dart';
import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddEditCategorySheet extends ConsumerStatefulWidget {
  const AddEditCategorySheet({super.key});

  @override
  ConsumerState<AddEditCategorySheet> createState() =>
      _AddEditCategorySheetState();
}

class _AddEditCategorySheetState extends ConsumerState<AddEditCategorySheet> {
  final TextEditingController categoryNameController = TextEditingController();
  final pickedIconProvider = StateProvider<IconDataModel?>((ref) => null);

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
                "Add a Category",
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
                child: ListView.builder(
                  itemCount: IconDataContants.iconPickList.length,
                  itemBuilder: (context, index) {
                    final iconPickCategory =
                        IconDataContants.iconPickList[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          iconPickCategory.category,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemCount: iconPickCategory.icons.length,
                          itemBuilder: (context, gridIndex) {
                            final iconData = iconPickCategory.icons[gridIndex];
                            return Consumer(
                              builder: (context, ref, child) {
                                final pickedIcon =
                                    ref.watch(pickedIconProvider);
                                final isSelected = pickedIcon == iconData;
                                return GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(pickedIconProvider.notifier)
                                        .update((state) => iconData);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.blue[200]
                                          : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          iconData.icon,
                                          size: 20.sp,
                                          color: Colors.black,
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          iconData.name,
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w400,
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
                    onPressed: () async {},
                    title: "Add",
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
    );
  }
}
