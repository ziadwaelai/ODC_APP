import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://3ca3-196-205-94-85.eu.ngrok.io/api/v1",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    required String token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      url,
      queryParameters: query ?? null,
    );
  }

  static Future<Response> postData({
    required String path,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'User-Agent': 'PostmanRuntime/7.29.0',
      'Connection': 'keep-alive',
      'Authorization': token
    };
    print("object");
    return await dio.post(path, queryParameters: query, data: data);
  }
}
