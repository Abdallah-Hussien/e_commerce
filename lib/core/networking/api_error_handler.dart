import 'package:dio/dio.dart';
import 'package:e_commerce/core/networking/api_error_model.dart';

class ApiErrorHandler {
  ApiErrorHandler._();

  /// Handle the error and return an ApiErrorModel
  // You can customize this method to handle different types of errors
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(
              message: 'Connection timeout', statusCode: '408');
        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: 'Send timeout', statusCode: '408');
        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: 'Receive timeout', statusCode: '408');
        case DioExceptionType.badResponse:
          return handleBadResponse(error.response?.data);
        case DioExceptionType.cancel:
          return ApiErrorModel(message: 'Request canceled', statusCode: '400');
        case DioExceptionType.unknown:
          return ApiErrorModel(message: 'Unknown error', statusCode: '500');
        case DioExceptionType.badCertificate:
          return ApiErrorModel(message: 'Bad certificate', statusCode: '400');
        case DioExceptionType.connectionError:
          return ApiErrorModel(message: 'Connection error', statusCode: '500');
      }
    } else {
      return ApiErrorModel(message: 'Logic error', statusCode: '500');
    }
  }

 
}
 ApiErrorModel handleBadResponse(dynamic data) {
    return ApiErrorModel(
      message: data['message'] ?? 'An error occurred',
      statusCode: data['statusCode']?.toString() ?? '500',
    );
  }