import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const CustomTextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(labelText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          hintText: 'Enter text',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
