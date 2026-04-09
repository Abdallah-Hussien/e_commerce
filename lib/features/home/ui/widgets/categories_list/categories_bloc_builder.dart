
import 'package:e_commerce/features/home/logic/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/ui/widgets/categories_list/categories_list.dart';
import 'package:e_commerce/features/home/ui/widgets/categories_list/categories_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) {
        return current is Error;
      },
      listener: (context, state) {
        if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      buildWhen: (previous, current) {
        return current is Loading ||
            current is CategoriesLoaded ||
            current is Error;
      },
      builder: (context, state) {
        if (state is Loading) {
          return const CategoriesListShimmer();
        }
        if (state is Error) {
          return const CategoriesList(categories: []);
        }
        if (state is CategoriesLoaded) {
          return CategoriesList(categories: state.categories);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
