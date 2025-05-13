import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScanQrCodeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 250.w,
      decoration: BoxDecoration(
        color: Color(0xFF5B2E62), // Olive-like background
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Container(
            height: 60.h,
            width: 43.w,
            decoration: BoxDecoration(
              color: Color(0xFF6A3372), // Slightly darker olive shade
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              Icons.qr_code_2_outlined,
              color: Color.fromRGBO(255, 255, 255, 0.7), // Icon color similar to screenshot
              size: 30.sp,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                "Scan QR Code",
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
