import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanDriverFace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: Color(0xFF646E3B), // Olive-like background
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 43.w,
            decoration: BoxDecoration(
              color: Color(0xFF4C5A24), // Slightly darker olive shade
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.person_2_outlined,
              color: Color.fromRGBO(255, 255, 255, 0.7), // Icon color similar to screenshot
              size: 30.sp,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Scan Driver Face",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
