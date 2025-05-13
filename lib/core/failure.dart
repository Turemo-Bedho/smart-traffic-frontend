import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message, [List props = const <dynamic>[]]) : super();
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
  @override
  List<Object?> get props => [super.message];
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
  @override
  List<Object?> get props => [];
}