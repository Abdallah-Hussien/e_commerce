import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({
    super.key,
    required this.selectedCategoryIndex,
    required this.index,
    required this.text,
  });

  final int index;
  final int selectedCategoryIndex;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      margin: (index != 0) ? EdgeInsetsDirectional.only(start: 12.w) : null,
      decoration: BoxDecoration(
        color: selectedCategoryIndex == index
            ? ColorManager.mainBlue
            : Colors.white,
        shape: BoxShape.rectangle,
        border: Border.all(
          color: ColorManager.moreLighterGray,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 7.h,
          ),
          child: Text(
            text,
            style: StyleManager.dark16Medium.copyWith(
              color: selectedCategoryIndex == index
                  ? Colors.white
                  : ColorManager.mainDark,
            ),
          ),
        ),
      ),
    );
  }
}
