
import 'package:e_commerce/core/networking/api_error_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';
@freezed
class ApiResult with _$ApiResult {
  const factory ApiResult.success(dynamic data) = Success;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure;
}