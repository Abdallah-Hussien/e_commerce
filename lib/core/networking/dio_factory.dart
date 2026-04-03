import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    const timeout = Duration(seconds: 10);
    _dio ??= Dio()
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.sendTimeout = timeout
      ..interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ));
    return _dio!;
  }
}
