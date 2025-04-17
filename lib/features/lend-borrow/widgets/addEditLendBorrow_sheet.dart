// ignore_for_file: unused_import

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
import 'package:expensetracker/features/lend-borrow/models/borrowLend_model.dart';
import 'package:expensetracker/features/persons/controller/personController.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:expensetracker/features/tags/models/tagModel.dart';
import 'package:expensetracker/features/tags/widgets/tagSelect_widget.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddEditBorrowAndLendSheet extends ConsumerStatefulWidget {
  final BorrowLendModel? borrowLendModel;
  const AddEditBorrowAndLendSheet({super.key, required this.borrowLendModel});

  @override
  ConsumerState<AddEditBorrowAndLendSheet> createState() =>
      _AddEditBorrowAndLendSheetState();
}

class _AddEditBorrowAndLendSheetState
    extends ConsumerState<AddEditBorrowAndLendSheet> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.borrowLendModel != null) {
      final borrowLendModel = widget.borrowLendModel!;
      amountController.text = borrowLendModel.amount.toString();
      notesController.text = borrowLendModel.note;
    }
    super.initState();
  }

  @override
  void dispose() {
    amountController.dispose();
    notesController.dispose();
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
                  widget.borrowLendModel != null
                      ? "Add a Transaction"
                      : "Edit a Teansaction",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  controller: amountController,
                  labelText: "Enter Amount",
                ),
                SizedBox(height: 10.h),
                TagSelectWidget(tagList: [
                  TagModel(
                      tagName: "TEST",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "sad",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "wer",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "5675",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "567567567",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "TE,kST",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                  TagModel(
                      tagName: "TESjhtT",
                      createdTime: "asd",
                      updatedTime: "asd",
                      isActive: 1),
                ], isSingleSelect: true),
                SizedBox(height: 10.h),
                CustomTextFieldWidget(
                  controller: notesController,
                  labelText: "Additional Notes",
                ),
                SizedBox(height: 10.h),
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
                        if (widget.borrowLendModel == null) {
                          await addTransaction();
                        } else {
                          await editTransaction();
                        }
                      },
                      title: widget.borrowLendModel == null ? "Add" : "Edit",
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

  Future<void> addTransaction() async {
    if (_formKey.currentState!.validate()) {}
  }

  Future<void> editTransaction() async {
    if (_formKey.currentState!.validate()) {}
  }
}
