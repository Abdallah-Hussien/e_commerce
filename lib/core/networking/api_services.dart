import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/home/data/models/category_model.dart';
import '../../features/home/data/models/product_model.dart';
import 'api_constants.dart';
part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String baseUrl}) = _ApiServices;
  
  @GET(ApiConstants.categories)
  Future<List<CategoryModel>> getCategories();

  @GET(ApiConstants.products)
  Future<List<ProductModel>> getAllProducts();

  //{{API_URL}}/api/v1/products/?offset=50&limit=10
  @GET(ApiConstants.products)
  Future<List<ProductModel>> getProductsByPagination(
    @Query('offset') int offset,
    @Query('limit') int limit,
  );
}
