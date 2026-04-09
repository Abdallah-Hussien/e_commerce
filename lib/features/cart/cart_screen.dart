// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:e_commerce/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:e_commerce/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../core/widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'My Cart',
            style: StyleManager.dark16SemiBold,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is InitialState ||
                  context.read<CartCubit>().cart.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        size: 100.w,
                        color: ColorManager.mainBlue,
                      ),
                      verticalSpace(20),
                      Text(
                        'Your cart is empty',
                        style: StyleManager.dark16Medium,
                      ),
                    ],
                  ),
                );
              } else {
                final cartList = context.read<CartCubit>().cart;
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: verticalSpace(26),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(
                              cartList.length,
                              (index) => CartListItem(
                                productModel: cartList[index],
                              ),
                            ).toList(),
                          ),
                          verticalSpace(30),
                          MoneyDetails(),
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          verticalSpace(54.h),
                          CustomButton(
                            onPressed: () {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.white,
                                    title: Text('Checkout'),
                                    content: Lottie.asset(
                                      'assets/lottie/shopping_cart.json',
                                      width: 150,
                                      height: 150,
                                    ),
                                  );
                                },
                              );
                              Future.delayed(Duration(milliseconds: 2260), () {
                                Navigator.of(context).pop();
                              });
                            },
                            text: 'Go To Checkout',
                          ),
                          verticalSpace(30),
                        ],
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
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
            child: Image.network(
              productModel.images,
              width: 80.w,
              height: 110.h,
              fit: BoxFit.cover,
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        productModel.title,
                        style: StyleManager.dark14SemiBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      style: IconButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size(23.w, 22.h),
                      ),
                      onPressed: () {
                        context.read<CartCubit>().removeFromCart(productModel);
                      },
                      icon: SvgPicture.asset(
                        width: 23.w,
                        height: 22.h,
                        'assets/icons/trash.svg',
                      ),
                    ),
                  ],
                ),
                Text(
                  'size: L',
                  style: StyleManager.lightGray12Regular,
                ),
                verticalSpace(10),
                // Spacer(),
                Row(
                  children: [
                    Text(
                      '\$${productModel.price}',
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
              '${context.read<CartCubit>().sub_total.toStringAsFixed(2)} EGP',
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
              '14%',
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
              '50 EGP',
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
              '${context.read<CartCubit>().total.toStringAsFixed(2)} EGP',
              style: StyleManager.dark16SemiBold,
            ),
          ],
        ),
      ],
    );
  }
}
