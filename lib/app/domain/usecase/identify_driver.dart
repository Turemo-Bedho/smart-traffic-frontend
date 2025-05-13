import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';
import 'package:my_flutter_application/app/domain/repositories/repository.dart';
import 'package:my_flutter_application/core/failure.dart';
import 'package:my_flutter_application/core/usecase.dart';

class IdentifyDriverUsecase implements Usecase<DriverEntity, IdentifyDriverParams> {
  final Repository repository;
  IdentifyDriverUsecase({required this.repository});

  @override
  Future<Either<Failure, DriverEntity>> call(IdentifyDriverParams params) async {
    return repository.identifyDriver(params.filePath);
  }
}

class IdentifyDriverParams extends Equatable {
  final String filePath;

  const IdentifyDriverParams({required this.filePath}):super();
  
  @override
  List<Object?> get props => [filePath];
}
