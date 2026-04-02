import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/categories_list/categories_list.dart';
import 'widgets/search_and_filter.dart';
import 'widgets/selected_category/selected_category_gridview.dart';

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
                Text(
                  'Discover',
                  style: StyleManager.dark32SmiBold,
                ),
                verticalSpace(16),
                SerachandFilter(),
                verticalSpace(16),
                const CategoriesList(),
                verticalSpace(23),
                const SelectedCategoryGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

