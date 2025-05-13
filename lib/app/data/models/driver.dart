import 'package:my_flutter_application/app/domain/entities/driver.dart';


class DriverModel extends DriverEntity {
  DriverModel({
    required int id,
    required String licenseNumber,
    required String firstName,
    required String middleName,
    required String lastName,
    required DateTime dateOfBirth,
    required String sex,
    required String phoneNumber,
    required String nationality,
    required DateTime licenseIssueDate,
    required String profileImage,
    required String processedImageUrl,
  }) : super(
          id: id,
          licenseNumber: licenseNumber,
          firstName: firstName,
          middleName: middleName,
          lastName: lastName,
          dateOfBirth: dateOfBirth,
          sex: sex,
          phoneNumber: phoneNumber,
          nationality: nationality,
          licenseIssueDate: licenseIssueDate,
          profileImage: profileImage,
          processedImageUrl: processedImageUrl,
        );

  factory DriverModel.fromJson(Map<String, dynamic> json) {
    final driver = json['driver'];
    return DriverModel(
      id: driver['id'],
      licenseNumber: driver['license_number'],
      firstName: driver['first_name'],
      middleName: driver['middle_name'],
      lastName: driver['last_name'],
      dateOfBirth: DateTime.parse(driver['date_of_birth']),
      sex: driver['sex'],
      phoneNumber: driver['phone_number'],
      nationality: driver['nationality'],
      licenseIssueDate: DateTime.parse(driver['license_issue_date']),
      profileImage: driver['profile_image'],
      processedImageUrl: json['processed_image_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driver': {
        'id': id,
        'license_number': licenseNumber,
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
        'date_of_birth': dateOfBirth,
        'sex': sex,
        'phone_number': phoneNumber,
        'nationality': nationality,
        'license_issue_date': licenseIssueDate,
        'profile_image': profileImage,
      },
      'processed_image_url': processedImageUrl,
    };
  }
}
