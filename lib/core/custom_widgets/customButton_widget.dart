import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String title;
  final double width;
  final double height;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.width = double.infinity,
    this.height = 40,
    this.textStyle,
    this.backgroundColor,
    this.borderRadius = 8,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  Future<void> handlePress() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    await widget.onPressed();

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print(isLoading);
    return ElevatedButton(
      onPressed: handlePress,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(widget.width, widget.height.h),
        backgroundColor: widget.backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      child: isLoading
          ? SizedBox(
              width: 20.w,
              height: 20.h,
              child: const CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.title,
              style: widget.textStyle ?? TextStyle(fontSize: 16.sp),
            ),
    );
  }
}
