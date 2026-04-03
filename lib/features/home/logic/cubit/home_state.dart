part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.categoriesLoaded(List<CategoryModel> categories) = CategoriesLoaded;
  const factory HomeState.error(String message) = Error;
  // For products
  const factory HomeState.productsLoading() = ProductsLoading;
  const factory HomeState.productsError(String message) = ProductsError;
  const factory HomeState.productsLoaded(List<ProductModel> products) = ProductsLoaded;
}
