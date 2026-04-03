
import 'package:awesome_dialog/awesome_dialog.dart';
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
          AwesomeDialog(
            context: context,
            dismissOnTouchOutside: false,
            animType: AnimType.leftSlide,
            dialogType: DialogType.noHeader,
            title: 'Failed',
            desc: 'Failed to load categories. Retry OR Cancel.',
            btnOkText: 'Retry',
            btnOkOnPress: () {},
            btnCancelText: 'Cancel',
            btnCancelOnPress: () {},
          ).show();
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
