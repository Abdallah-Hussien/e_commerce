import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/repo/home_repo.dart';

part 'home_state.dart';
part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit({required this.homeRepo}) : super(const HomeState.initial());

  getCategories() async {
    emit(const HomeState.loading());
    final result = await homeRepo.getCategories();
    result.when(
        success: (data) async {
          getProductsByCategory(categoryId: 0);
          await Future.delayed(const Duration(seconds: 2));
          emit(HomeState.categoriesLoaded(data));
        },
        failure: (error) =>
            emit(HomeState.error(error.message ?? 'An error occurred')));
  }

  getProductsByCategory({required int categoryId}) async {
    emit(const HomeState.productsLoading());
    log('Category ID: $categoryId', name: 'HomeCubit');
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = listOfProduct
          .where((product) => int.parse(product.categoryId) == categoryId + 1)
          .toList();
      log('Filtered Products: $result', name: 'HomeCubit');
      emit(HomeState.productsLoaded(result));
    } catch (e) {
      log('Error occurred while fetching products: $e', name: 'HomeCubit');
      emit(HomeState.productsError(e.toString()));
    }
  }
}
