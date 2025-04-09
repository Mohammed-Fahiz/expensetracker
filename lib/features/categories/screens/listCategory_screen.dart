import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
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
    super.dispose();
    categoryNameController.dispose();
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
              addOrEditCategory();
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addOrEditCategory() async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
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
                  ),
                  SizedBox(height: 20.h),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                    ),
                    child: Text(
                      "Close",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      barrierColor: Colors.black45,
      backgroundColor: Colors.white,
    );
  }
}
