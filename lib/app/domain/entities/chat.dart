import 'package:equatable/equatable.dart';

class ReportEntity extends Equatable {
  final String pdfUrl;
  final String confidence;

  const ReportEntity({
    required this.pdfUrl,
    required this.confidence,
  });

  @override
  List<Object?> get props => [pdfUrl, confidence];
}
