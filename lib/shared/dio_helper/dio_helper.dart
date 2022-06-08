import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://192.168.8.100:8000/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
  }) async {
    return await dio!.get(url);
  }
}
