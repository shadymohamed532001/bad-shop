import 'package:bag/Core/Uitls/endBoint.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> postData({
    required String endpoint,
    required Object? data,
    String? token,
    String lang = 'ar',
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'lang': lang,
    };
    return await dio!.post(
      endpoint,
      data: data,
    );
  }

  static Future<Response> getData(
      {required String endpoint,
      Object? data,
      String? token,
      String lang = 'ar',
      Map<String, dynamic>? queryParameters}) async {
    dio?.options.headers = {
      'Authorization': token,
      'Content-Type': 'application/json',
      'lang': lang,
    };
    return await dio!.get(endpoint, queryParameters: queryParameters);
  }
}
