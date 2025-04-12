import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalLendBorrowCardWidget extends ConsumerWidget {
  final String title;
  final String amount;
  const TotalLendBorrowCardWidget(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 0.08.sh,
      width: 0.45.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
        border: Border.all(
          color: Colors.black,
          width: 0.001.sh,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 0.02.sw,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lended Amount",
              style: TextStyle(
                fontSize: 0.015.sh,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 0.005.sh),
            Text(
              "0.00",
              style: TextStyle(
                fontSize: 0.035.sh,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
