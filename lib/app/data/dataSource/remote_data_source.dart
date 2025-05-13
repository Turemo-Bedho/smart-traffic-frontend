import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_application/app/data/dataSource/local_data_source.dart';
import 'package:my_flutter_application/app/data/models/driver.dart';
import 'package:my_flutter_application/core/base_url.dart';
import 'package:my_flutter_application/core/exception.dart';

abstract class RemoteDataSource {
  LocalDataSource get localDataSource;
  Future<DriverModel> identifyDriver(String filePath);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  final LocalDataSource localDataSource;

  final http.Client client;

  RemoteDataSourceImpl({required this.localDataSource, required this.client});

  @override
  Future<DriverModel> identifyDriver(String filePath) async {
    String url = '$baseUrl/traffic/drivers/identify/';
    final Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath(
        'image',
        filePath,
      ),
    );
    final response = await request.send();
    print("Response status code: ${response.statusCode}");
    print("Response body: $response");
    if (response.statusCode == 200) {
      print("Response status code: ${response.statusCode}");
      final responseData = jsonDecode(await response.stream.bytesToString());
      return DriverModel.fromJson(responseData);
    }
    throw ServerException();
  }
}
