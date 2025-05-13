part of 'driver_recognition_bloc.dart';

sealed class DriverRecognitionState extends Equatable {
  const DriverRecognitionState();
  
  @override
  List<Object> get props => [];
}

final class DriverRecognitionInitial extends DriverRecognitionState {}


final class DriverRecognitionLoading extends DriverRecognitionState {}


final class DriverRecognitionSuccess extends DriverRecognitionState {
  final DriverEntity driver;
  const DriverRecognitionSuccess({required this.driver});
  
  @override
  List<Object> get props => [driver];
}


final class DriverRecognitionError extends DriverRecognitionState {
  final String message;
  const DriverRecognitionError({required this.message});
  
  @override
  List<Object> get props => [message];
}