import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterLicenceNumberButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: Color.fromRGBO(46, 98, 76, 1), // Olive-like background
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 43.w,
            decoration: BoxDecoration(
              color: Color.fromRGBO(39, 115, 96, 1), // Slightly darker olive shade
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.badge_outlined,
              color: Color.fromRGBO(255, 255, 255, 0.7), // Icon color similar to screenshot
              size: 30.sp,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Enter Licence Number",
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
