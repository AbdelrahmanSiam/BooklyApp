import 'package:dio/dio.dart';

class ApiServices {
  // wrapper class for public methods as get , put ....
  final String _baserUrl = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;

  ApiServices(this._dio);
  // 1- Get method
  Future<Map<String, dynamic>> get({
    required String endPoints,
    Map<String, dynamic>? queryParameters,
  }) async {
    // we know that our data as map (item) we will get it using get method in dio package so return type is Future<Map<String, dynamic>> and store this map at response variable and return response.data
    Response response = await _dio.get(
      '$_baserUrl$endPoints',
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
