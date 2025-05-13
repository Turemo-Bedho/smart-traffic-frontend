part of 'driver_recognition_bloc.dart';

sealed class DriverRecognitionEvent extends Equatable {
  const DriverRecognitionEvent();

  @override
  List<Object> get props => [];
}

class ProcessFrameDriverRecognitionEvent extends DriverRecognitionEvent {
  final String filePath;
  const ProcessFrameDriverRecognitionEvent({required this.filePath});
}