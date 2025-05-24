

import 'package:my_flutter_application/app/domain/entities/chat.dart';

class ReportModel extends ReportEntity {
  const ReportModel({
    required String pdfUrl,
    required String confidence,
  }) : super(
          pdfUrl: pdfUrl,
          confidence: confidence,
        );

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      pdfUrl: json['pdf_url'] ?? '',
      confidence: json['metadata']?['confidence'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'pdf_url': pdfUrl,
      'confidence': confidence,
    };
  }
}
