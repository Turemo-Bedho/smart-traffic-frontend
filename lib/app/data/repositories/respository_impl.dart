import 'package:dartz/dartz.dart';
import 'package:my_flutter_application/app/data/dataSource/remote_data_source.dart';
import 'package:my_flutter_application/app/domain/entities/chat.dart';
import 'package:my_flutter_application/app/domain/entities/driver.dart';
import 'package:my_flutter_application/app/domain/repositories/repository.dart';
import 'package:my_flutter_application/core/failure.dart';
import 'package:my_flutter_application/core/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  const RepositoryImpl({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, DriverEntity>> identifyDriver(String filePath) async {
    if (await networkInfo.isConnected) {
      
      try {
        final ans = await remoteDataSource.identifyDriver(filePath);
        return Right(ans);
      } catch (e) {
        return const Left(ServerFailure("Server is not working properly."));
      }
    } else {
      return const Left(NetworkFailure("Please connect to the internet."));
    }
  }

  @override
  Future<Either<Failure, ReportEntity>> sendQuery(String query) async {
    if (await networkInfo.isConnected) {
      
      try {
        final ans = await remoteDataSource.sendQuery(query);
        return Right(ans);
      } catch (e) {
        return const Left(ServerFailure("Server is not working properly."));
      }
    } else {
      return const Left(NetworkFailure("Please connect to the internet."));
    }
  }
}