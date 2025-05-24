import 'package:my_flutter_application/app/domain/entities/driver.dart';

final Map<String, dynamic> jsonResponse = {
  "driver": {
    "id": 2,
    "license_number": "232122",
    "first_name": "Yohanse",
    "middle_name": "Mehabaw",
    "last_name": "Endalew",
    "date_of_birth": "1990-05-15",
    "sex": "M",
    "phone_number": "0960192962",
    "nationality": "Ethiopia",
    "license_issue_date": "1990-05-15",
    "blood_type": "A+",
    "profile_image":
        "http://varying-messages-pot-sn.trycloudflare.com/media/profile/images/2_5pdwswc.jpg",
    "created_at": "2025-05-10T11:37:09.678315Z",
    "updated_at": "2025-05-10T11:37:09.691249Z",
    "addresses": []
  },
  "processed_image_url":
      "http://varying-messages-pot-sn.trycloudflare.com/media/processed_images/fe8714b892f2454da6dcd98f49f02766.jpg"
};

final DriverEntity driverTest = DriverEntity(
  id: jsonResponse['driver']['id'],
  licenseNumber: jsonResponse['driver']['license_number'],
  firstName: jsonResponse['driver']['first_name'],
  middleName: jsonResponse['driver']['middle_name'],
  lastName: jsonResponse['driver']['last_name'],
  dateOfBirth: DateTime.parse(jsonResponse['driver']['date_of_birth']),
  sex: jsonResponse['driver']['sex'],
  phoneNumber: jsonResponse['driver']['phone_number'],
  nationality: jsonResponse['driver']['nationality'],
  licenseIssueDate: DateTime.parse(jsonResponse['driver']['license_issue_date']),
  profileImage: jsonResponse['driver']['profile_image'],
  processedImageUrl: jsonResponse['processed_image_url'],
);
