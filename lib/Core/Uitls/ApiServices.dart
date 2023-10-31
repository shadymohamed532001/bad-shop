import 'package:bag/Core/Uitls/endBoint.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
        }));
  }

  static Future<Response> PostData({
    required String endpoint,
    required Object? data,
    String? token,
    String lang = 'ar',
  }) async {
    dio?.options.headers = {
      'Authorization': token,
      'lang': lang,
    };
    return await dio!.post(
      endpoint,
      data: data,
    );
  }
}
