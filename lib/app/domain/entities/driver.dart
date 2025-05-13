// domain/entities/driver_entity.dart
import 'package:equatable/equatable.dart';

class DriverEntity extends Equatable {
  final int id;
  final String licenseNumber;
  final String firstName;
  final String middleName;
  final String lastName;
  final DateTime dateOfBirth;
  final String sex;
  final String phoneNumber;
  final String nationality;
  final DateTime licenseIssueDate;
  final String profileImage;
  final String processedImageUrl;

  const DriverEntity({
    required this.id,
    required this.licenseNumber,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dateOfBirth,
    required this.sex,
    required this.phoneNumber,
    required this.nationality,
    required this.licenseIssueDate,
    required this.profileImage,
    required this.processedImageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        licenseNumber,
        firstName,
        middleName,
        lastName,
        dateOfBirth,
        sex,
        phoneNumber,
        nationality,
        licenseIssueDate,
        profileImage,
        processedImageUrl,
      ];
}
