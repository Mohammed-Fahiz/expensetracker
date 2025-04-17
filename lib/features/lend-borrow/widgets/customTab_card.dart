import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTabCardWidget extends ConsumerWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const CustomTabCardWidget({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 0.25.sw,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 0.03.sh,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(0),
            border: Border.all(
              color: Colors.black,
              width: 0.001.sh,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (icon != null)
                Icon(
                  icon,
                  size: 0.02.sh,
                  color: Colors.black,
                ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
