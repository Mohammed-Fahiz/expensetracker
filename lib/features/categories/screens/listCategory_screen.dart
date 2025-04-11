import 'package:expensetracker/core/custom_widgets/customTextField_widget.dart';
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
              addEditCategorySheet(context: context);
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addEditCategorySheet({required BuildContext context}) async {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return const AddEditCategorySheet();
      },
    );
  }
}
