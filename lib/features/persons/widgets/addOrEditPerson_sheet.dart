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
import 'package:expensetracker/features/persons/controller/personController.dart';
import 'package:expensetracker/features/persons/models/person_model.dart';
import 'package:expensetracker/models/icon_models/iconData_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddEditPersonSheet extends ConsumerStatefulWidget {
  final PersonModel? personModel;
  const AddEditPersonSheet({super.key, required this.personModel});

  @override
  ConsumerState<AddEditPersonSheet> createState() => _AddEditPersonSheetState();
}

class _AddEditPersonSheetState extends ConsumerState<AddEditPersonSheet> {
  final TextEditingController personNameController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.personModel != null) {
      final personModel = widget.personModel!;
      personNameController.text = personModel.name;
      notesController.text = personModel.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    personNameController.dispose();
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
                  widget.personModel != null ? "Add a Person" : "Edit a Person",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.h),
                CustomTextFieldWidget(
                  controller: personNameController,
                  labelText: "Person Name",
                ),
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
                        if (widget.personModel == null) {
                          await addPerson();
                        } else {
                          await editPerson();
                        }
                      },
                      title: widget.personModel == null ? "Add" : "Edit",
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

  Future<void> addPerson() async {
    if (_formKey.currentState!.validate()) {
      final personModel = PersonModel(
        name: personNameController.text,
        notes: notesController.text,
        createdTime: DateTime.now().toIso8601String(),
        updatedTime: DateTime.now().toIso8601String(),
        isActive: 1,
      );
      await ref.read(personControllerProvider.notifier).addPerson(
            personModel: personModel,
            context: context,
          );
    }
  }

  Future<void> editPerson() async {
    final oldCategoryModel = widget.personModel!;
    final updatedCategoruModel = oldCategoryModel.copyWith(
      name: personNameController.text,
      notes: notesController.text,
      updatedTime: DateTime.now().toIso8601String(),
    );

    if (_formKey.currentState!.validate()) {
      await ref.read(personControllerProvider.notifier).updatePerson(
            personModel: updatedCategoruModel,
            context: context,
          );
    }
  }
}
