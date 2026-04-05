import 'dart:developer';

import 'package:e_commerce/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialState(cartList: []));
  var cart = <ProductModel>[];
  addToCart(ProductModel product) {
    cart.add(product);
    emit(AddToCartState(cartList: []));
    log('AddToCartState: ${cart.length} items in cart', name: 'CartCubit');
  }

test(){
  log('test: ${cart.length} items in cart', name: 'CartTest');
  emit(AddToCartState(cartList: []));
}
  removeFromCart(ProductModel product) {
    cart.remove(product);
    emit(RemoveFromCartState(cartList: cart));
    log('RemoveFromCartState: ${cart.length} items in cart', name: 'CartCubit');
  }
}
