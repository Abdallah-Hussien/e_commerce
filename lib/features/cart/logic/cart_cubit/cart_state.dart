import '../../../home/data/models/product_model.dart';

sealed class CartState {}

class InitialState extends CartState {
  final List<ProductModel> cartList;
  InitialState({required this.cartList});
}

class AddToCartState extends CartState {
  final List<ProductModel> cartList;
  AddToCartState({required this.cartList});
}

class RemoveFromCartState extends CartState {
  final List<ProductModel> cartList;
  RemoveFromCartState({required this.cartList});
}
