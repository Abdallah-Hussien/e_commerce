import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class StyleManager {
  StyleManager._();
  static TextStyle dark32SmiBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorManager.mainDark,
  );

  static TextStyle lighterGray16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.lighterGray,
  );

  static TextStyle lightGray16Regular = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorManager.lightGray,
  );

  static TextStyle lightGray16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManager.lightGray,
  );

  static TextStyle dark16Medium = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManager.mainDark,
  );
    static TextStyle dark16SemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: ColorManager.mainDark,
  );

    static TextStyle lightGray12Medium = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorManager.lightGray,
  );
}
