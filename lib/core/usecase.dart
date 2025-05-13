import 'package:dartz/dartz.dart';
import 'package:my_flutter_application/core/failure.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}