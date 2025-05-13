import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_flutter_application/app/presentation/widget/enter_licence_number.dart';
import 'package:my_flutter_application/app/presentation/widget/scan_driver_face.dart';
import 'package:my_flutter_application/app/presentation/widget/scan_qr_code.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Welcom Officer",
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w300,
            color: Color(0xFF1F222A),
          ),
        ),
        SizedBox(
          height: 200.h,
        ),
        Center(
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Scan & Identify Driver",
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.h,
              ),
              GestureDetector(
                onTap: () => context.push('/camera'),
                child: ScanDriverFace(),
              ),
              ScanQrCodeButton(),
              EnterLicenceNumberButton(),
            ],
          ),
        )
      ],
    );
  }
}
