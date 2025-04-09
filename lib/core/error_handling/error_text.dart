import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  final dynamic errorText;
  const ErrorText({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText.toString(),
        style: const TextStyle(
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
