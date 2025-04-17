import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TagTileWidget extends ConsumerWidget {
  final String tagName;
  final bool isSelected;
  const TagTileWidget({
    super.key,
    required this.tagName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
          width: 0.001.sh,
        ),
      ),
      child: Text(
        tagName,
        style: TextStyle(
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
