import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final Function(String)? onChanged;

  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        hintText: hintText ?? 'Enter text',
      ),
      style: theme.textTheme.bodyMedium,
      onChanged: onChanged,
    );
  }
}
