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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.w),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(driver.profileImage),
                    onBackgroundImageError: (exception, stackTrace) {
                    },
                    child: driver.profileImage.isEmpty
                        ? const Icon(Icons.person, size: 60)
                        : null,
                  ),
                ),
                const SizedBox(height: 16),
                _buildDetailRow('License Number', driver.licenseNumber),
                _buildDetailRow('First Name', driver.firstName),
                _buildDetailRow('Last Name', driver.lastName),
                _buildDetailRow(
                    'Date of Birth', dateFormatter.format(driver.dateOfBirth)),
                _buildDetailRow('Sex', driver.sex == 'M' ? 'Male' : 'Female'),
                _buildDetailRow('Phone Number', driver.phoneNumber),
                _buildDetailRow('Nationality', driver.nationality),
                _buildDetailRow('License Issue Date',
                    dateFormatter.format(driver.licenseIssueDate)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
