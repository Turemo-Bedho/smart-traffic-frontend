import 'package:dartz/dartz.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';
import 'package:my_flutter_application/core/failure.dart';

abstract class Repository {
  Future<Either<Failure, DriverEntity>> identifyDriver(String filePath);
}