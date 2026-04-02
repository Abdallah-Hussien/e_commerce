import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:flutter/material.dart';


class SelectedCategoryCridViewItem extends StatelessWidget {
  const SelectedCategoryCridViewItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productPrice,
  });

  final String imagePath ;
  final String productName ;
  final String productPrice ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              // height: 174.h,
              fit: BoxFit.cover,
              // color: Colors.grey[300],
            ),
          ),
          verticalSpace(8),
          Text(productName, style: StyleManager.dark16SemiBold),
          Text(productPrice, style: StyleManager.lightGray12Medium),
        ],
      ),
    );
  }
}
