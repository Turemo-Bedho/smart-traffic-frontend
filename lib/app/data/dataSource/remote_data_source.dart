import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_flutter_application/app/data/dataSource/local_data_source.dart';
import 'package:my_flutter_application/app/data/models/chat.dart';
import 'package:my_flutter_application/app/data/models/driver.dart';
import 'package:my_flutter_application/core/base_url.dart';
import 'package:my_flutter_application/core/exception.dart';

abstract class RemoteDataSource {
  LocalDataSource get localDataSource;
  Future<DriverModel> identifyDriver(String filePath);
  Future<ReportModel> sendQuery(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  @override
  final LocalDataSource localDataSource;

  final http.Client client;

  RemoteDataSourceImpl({required this.localDataSource, required this.client});

  @override
  Future<DriverModel> identifyDriver(String filePath) async {
    final String url = '$baseUrl/traffic/drivers/identify/';
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

  @override
  Future<ReportModel> sendQuery(String query) async {
    final String url = '$baseUrl/generate-report/';
    print("URL: $url");
    print("Query: $query");
    print("Query: $query");

    final response = await client.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'query': query,
      }),
    );

    print("Response status code: ${response.statusCode}");
    print("Response body: $response");

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print("Response data: $responseData");
      return ReportModel.fromJson(responseData);
    }
    throw ServerException();
  }
}
