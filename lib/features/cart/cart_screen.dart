// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(24),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                BackButtonAndHeader(),
                verticalSpace(16),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => CartListItem(),
              childCount: 5, // Replace with actual item count
            ),
          ),
          // SliverFillRemaining(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: 5, // Replace with actual item count
          //     itemBuilder: (context, index) {
          //       return CartListItem();
          //     },
          //   ),
          // ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                verticalSpace(30),
                MoneyDetails(),
                verticalSpace(54.h),
                CustomButton(
                  onPressed: () {},
                  text: 'Go To Checkout',
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190.h,
      margin: EdgeInsetsDirectional.symmetric(vertical: 8),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManager.moreLighterGray,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/shoes.png',
              width: 83.w,
              // height: 80.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Regular Fit Slogan',
                      style: StyleManager.dark14SemiBold,
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/trash.svg',
                      ),
                    ),
                  ],
                ),
                Text(
                  'size: L',
                  style: StyleManager.lightGray12Regular,
                ),
                verticalSpace(18),
                Spacer(),
                Row(
                  children: [
                    Text(
                      '150 EGP',
                      style: StyleManager.dark14SemiBold,
                    ),
                    Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(23.w, 22.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(
                            color: ColorManager.moreLighterGray,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.remove),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.symmetric(horizontal: 4.0.w),
                      child: Text('1'),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(23.w, 22.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                          side: BorderSide(
                            color: ColorManager.moreLighterGray,
                          ),
                        ),
                      ),
                      onPressed: () {},
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MoneyDetails extends StatelessWidget {
  const MoneyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Sub-total',
              style: StyleManager.lightGray16Regular,
            ),
            Spacer(),
            Text(
              'data',
              style: StyleManager.dark16Medium,
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Text(
              'VAT (%)',
              style: StyleManager.lightGray16Regular,
            ),
            Spacer(),
            Text(
              'data',
              style: StyleManager.dark16Medium,
            ),
          ],
        ),
        verticalSpace(12),
        Row(
          children: [
            Text(
              'Shipping fee',
              style: StyleManager.lightGray16Regular,
            ),
            Spacer(),
            Text(
              'data',
              style: StyleManager.dark16Medium,
            ),
          ],
        ),
        verticalSpace(15),
        Divider(
          height: 2.h,
          color: ColorManager.moreLighterGray,
          thickness: 2.h,
        ),
        verticalSpace(12),
        Row(
          children: [
            Text(
              'Total',
              style: StyleManager.dark16Regular,
            ),
            Spacer(),
            Text(
              'data',
              style: StyleManager.dark16SemiBold,
            ),
          ],
        ),
      ],
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
                const Text(
                  'Cart',
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
