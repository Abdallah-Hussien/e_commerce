import 'package:e_commerce/features/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/ui/widgets/selected_category/selected_category_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class SelectedCategoriesBlocBuilder extends StatelessWidget {
  const SelectedCategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) {
        return current is ProductsLoading ||
            current is ProductsLoaded ||
            current is ProductsError;
      },
      builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: Lottie.asset(
              'assets/lottie/loading.json',
              width: 250,
              height: 250,
            ),
          );
        }
        if (state is ProductsError) {
          return const SelectedCategoryGridView(products: []);
        }
        if (state is ProductsLoaded) {
          return SelectedCategoryGridView(products: state.products);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
