import 'dart:developer';

import 'package:e_commerce/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(InitialState(cartList: []));
  var cart = <ProductModel>[];
  var sub_total = 0.0;
  var total = 0.0;
  addToCart(ProductModel product) {
    cart.add(product);
    sub_total += product.price;
    total = sub_total + (sub_total * 0.14)+50;
    emit(AddToCartState(cartList: []));
    // log('AddToCartState: ${cart.length} items in cart', name: 'CartCubit');
  }
  removeFromCart(ProductModel product) {
    cart.remove(product);
    sub_total -= product.price;
    total = sub_total + (sub_total * 0.14)+50;
    emit(RemoveFromCartState(cartList: []));
    // log('RemoveFromCartState: ${cart.length} items in cart', name: 'CartCubit');
  }
}
