import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'categories_list_item.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({
    super.key,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final listOFCategories = [
    'All',
    'Clothes',
    'Shoes',
    'Accessories',
    'Electronics',
    'Home & Garden',
    'Toys',
  ];

  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listOFCategories.length, // Replace with actual item count
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategoryIndex = index;
                });
              },
              child: CategoriesListItem(
                selectedCategoryIndex: selectedCategoryIndex,
                index: index,
                text: listOFCategories[index],
              ),
            );
          }),
    );
  }
}
