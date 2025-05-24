import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_application/app/domain/entities/chat.dart';
import 'package:my_flutter_application/app/domain/repositories/repository.dart';
import 'package:my_flutter_application/core/failure.dart';
import 'package:my_flutter_application/core/usecase.dart';

class SendQueryUsecase implements Usecase<ReportEntity, SendQueryParams> {
  final Repository repository;
  SendQueryUsecase({required this.repository});

  @override
  Future<Either<Failure, ReportEntity>> call(SendQueryParams params) async {
    return repository.sendQuery(params.query);
  }
}

class SendQueryParams extends Equatable {
  final String query;

  const SendQueryParams({required this.query}):super();
  
  @override
  List<Object?> get props => [query];
}
