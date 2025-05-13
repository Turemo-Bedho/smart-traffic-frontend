import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';
import 'package:my_flutter_application/app/domain/usecase/identify_driver.dart';

part 'driver_recognition_event.dart';
part 'driver_recognition_state.dart';

class DriverRecognitionBloc extends Bloc<DriverRecognitionEvent, DriverRecognitionState> {
  final IdentifyDriverUsecase identifyDriverUsecase;

  DriverRecognitionBloc({required this.identifyDriverUsecase}) : super(DriverRecognitionInitial()) {
    on<ProcessFrameDriverRecognitionEvent>(_onProcessFrameDriverRecognition);
  }

  void _onProcessFrameDriverRecognition(ProcessFrameDriverRecognitionEvent event, Emitter<DriverRecognitionState> emit) async {
    print("Processing frame for driver recognition: ${event.filePath}");
    emit(DriverRecognitionLoading());
    final result = await identifyDriverUsecase(IdentifyDriverParams(filePath: event.filePath));
    result.fold(
      (failure) {
        emit(DriverRecognitionError(message: failure.message));
      },
      (driver) {
        emit(DriverRecognitionSuccess(driver: driver));
      },
    );
  }
}
