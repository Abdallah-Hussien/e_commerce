import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theme/color_manager.dart';
import '../../../../core/widgets/app_form_text_field.dart';

class SerachandFilter extends StatelessWidget {
  SerachandFilter({super.key});
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppFormTextField(
            controller: controller,
            hint: 'Search for clothes...',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                'assets/icons/search.svg',
              ),
            ),
          ),
        ),
        horizontalSpace(8.w),
        IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.symmetric(
              horizontal: 14.w,
              vertical: 14.h,
            ),
            backgroundColor: ColorManager.mainBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/filter.svg',
          ),
        ),
      ],
    );
  }
}
