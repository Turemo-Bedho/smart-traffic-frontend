import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:my_flutter_application/app/data/dataSource/local_data_source.dart';
import 'package:my_flutter_application/app/data/dataSource/remote_data_source.dart';
import 'package:my_flutter_application/app/data/repositories/respository_impl.dart';
import 'package:my_flutter_application/app/domain/repositories/repository.dart';
import 'package:my_flutter_application/app/domain/usecase/identify_driver.dart';
import 'package:my_flutter_application/app/presentation/blocs/driver_recognition/driver_recognition_bloc.dart';
import 'package:my_flutter_application/core/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> init() async {
  serviceLocator.registerFactory(() => DriverRecognitionBloc(identifyDriverUsecase: serviceLocator()));
  serviceLocator.registerLazySingleton(() => IdentifyDriverUsecase(repository: serviceLocator()));
  serviceLocator.registerLazySingleton<Repository>(() => RepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(localDataSource: serviceLocator(), client: serviceLocator()));
  serviceLocator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(preferences: serviceLocator()));

  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(connectionChecker: serviceLocator()));
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => InternetConnectionChecker.createInstance());
  serviceLocator.registerLazySingleton(() => http.Client());
}