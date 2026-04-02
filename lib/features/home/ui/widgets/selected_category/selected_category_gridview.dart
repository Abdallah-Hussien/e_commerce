import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'selected_category_gridview_item.dart';

class SelectedCategoryGridView extends StatelessWidget {
  const SelectedCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsetsDirectional.symmetric(vertical: 14.0.w),
        itemCount: 6, // Example item count
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20.h,
          crossAxisSpacing: 19.w,
          childAspectRatio: 2.13 / 3,
        ),
        itemBuilder: (context, index) {
          return const SelectedCategoryCridViewItem(
            imagePath: 'assets/images/shoes.png',
            productName: 'Product Name',
            productPrice: '\$99.99',
          );
        },
      ),
    );
  }
}

