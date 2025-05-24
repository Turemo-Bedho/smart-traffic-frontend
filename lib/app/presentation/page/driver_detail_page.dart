import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';

class Driver {
  final String licenseNumber;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final String? address;
  final String sex;
  final String region;
  final String woreda;
  final String houseNumber;
  final String phoneNumber;
  final String nationality;
  final DateTime licenseIssueDate;
  final String bloodType;
  final String profileImageUrl;

  Driver({
    required this.licenseNumber,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    this.address,
    required this.sex,
    required this.region,
    required this.woreda,
    required this.houseNumber,
    required this.phoneNumber,
    required this.nationality,
    required this.licenseIssueDate,
    required this.bloodType,
    required this.profileImageUrl,
  });
}

class DriverDetailsPage extends StatelessWidget {
  final DriverEntity driver;

  const DriverDetailsPage({super.key, required this.driver});

  @override
  Widget build(BuildContext context) {
    final dateFormatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recognized Face',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        backgroundColor: Color(0xFF1F222A),
      ),
      backgroundColor: Color.fromRGBO(18, 18, 18, 1),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
        child: Column(
          spacing: 40.h,
          children: [
            Card(
              color: Color(0xFF1F222A),
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 12.h,
                  children: [
                    CircleAvatar(
                      radius: 60.r,
                      backgroundImage: NetworkImage(driver.profileImage),
                      onBackgroundImageError: (exception, stackTrace) {},
                      child: driver.profileImage.isEmpty
                          ? const Icon(Icons.person, size: 60)
                          : null,
                    ),
                    SizedBox(height: 16.h),
                    _buildDetailRow('License Number', driver.licenseNumber),
                    _buildDetailRow('Name',
                        '${driver.firstName} ${driver.middleName} ${driver.lastName}'),
                    _buildDetailRow('Date of Birth',
                        dateFormatter.format(driver.dateOfBirth)),
                    _buildDetailRow(
                        'Sex', driver.sex == 'M' ? 'Male' : 'Female'),
                    _buildDetailRow('Phone Number', driver.phoneNumber),
                    _buildDetailRow('Nationality', driver.nationality),
                    _buildDetailRow('License Issue Date',
                        dateFormatter.format(driver.licenseIssueDate)),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80.h,
              child: Card(
                color: Color(0xFF1F222A),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20.w,
                  children: [
                    Text(
                      "Process Violation",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ),
                    Icon(Icons.arrow_forward_rounded,
                        color: Colors.white, size: 20.sp),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
            ),
          ),
        ),
      ],
    );
  }
}
