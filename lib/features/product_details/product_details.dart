// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/font_weight_helper.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ─── Main Scrollable Content ───────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AppBar Row
                    BackButtonAndHeader(),
                    // Product Image
                    ProductImage(image: productModel.images),
                    verticalSpace(8),
                    // ─── Product Info Section ─────────────────────────
                    ProductInfo(productModel: productModel),
                    verticalSpace(80), // Space for bottom bar
                  ],
                ),
              ),
            ),
            Divider(
              color: ColorManager.moreLighterGray,
              height: 2.h,
            ),
            // ─── Bottom Price + Add to Cart Bar ───────────────────────
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
              child: Row(
                children: [
                  // Price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: ColorManager.lightGray,
                          fontWeight: FontWeightHelper.regular,
                        ),
                      ),
                      verticalSpace(2),
                      Text(
                        '\$ ${productModel.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeightHelper.semiBold,
                          color: ColorManager.mainDark,
                        ),
                      ),
                    ],
                  ),
                  horizontalSpace(20),
                  // Add to Cart Button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // /TODO: Implement add to cart functionality
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/add_to_cart.svg',
                      ),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightHelper.medium,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(0, 56),
                        backgroundColor: ColorManager.mainBlue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Name
          Text(
            productModel.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: ColorManager.mainDark,
            ),
          ),
          verticalSpace(8),
          // Rating Row
          Row(
            children: [
              const Icon(Icons.star_rounded,
                  color: Color(0xFFF59E0B), size: 20),
              const SizedBox(width: 4),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '4.0/5',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeightHelper.medium,
                        color: ColorManager.mainDark,
                      ),
                    ),
                    TextSpan(
                      text: ' (45 reviews)',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: ColorManager.lightGray,
                        fontWeight: FontWeightHelper.medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(14),
          // Description
          Text(
            productModel.description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 16.h),
      child: Center(
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.contain,
          imageBuilder: (context, imageProvider) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 368.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BackButtonAndHeader extends StatelessWidget {
  const BackButtonAndHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                // Back Button
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/arrow_back.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
