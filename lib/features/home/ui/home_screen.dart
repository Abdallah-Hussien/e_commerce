// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:e_commerce/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/home/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/categories_list/categories_bloc_builder.dart';
import 'widgets/search_and_filter.dart';
import 'widgets/selected_category/selected_categories_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                verticalSpace(60),
                GestureDetector(
                  onTap: () {
                    context.read<HomeCubit>().getCategories();
                  },
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Text(
                      'Discover',
                      style: StyleManager.dark32SmiBold,
                    ),
                  ),
                ),
                verticalSpace(16),
                SerachandFilter(),
                verticalSpace(16),
                Expanded(
                    child: Column(
                  children: [
                    const CategoriesBlocBuilder(),
                    verticalSpace(16),
                    const SelectedCategoriesBlocBuilder(),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
