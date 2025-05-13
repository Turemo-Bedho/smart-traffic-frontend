import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  SharedPreferences get preferences;
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  SharedPreferences preferences;

  LocalDataSourceImpl({required this.preferences});
}