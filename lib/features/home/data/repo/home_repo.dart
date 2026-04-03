import 'package:e_commerce/core/networking/api_error_handler.dart';
import 'package:e_commerce/core/networking/api_result.dart';
import 'package:e_commerce/core/networking/api_services.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';

class HomeRepo {
  final ApiServices apiServices;
  HomeRepo({required this.apiServices});
  
  Future<ApiResult> getCategories() async {
    try {
      // final result = await apiServices.getCategories();
      final result = listOfCategories;
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
