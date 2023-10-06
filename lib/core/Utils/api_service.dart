import 'package:dio/dio.dart';

class ApiServise {
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?';
  final Dio _dio;

  ApiServise({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');
    return response.data;
  }
}
