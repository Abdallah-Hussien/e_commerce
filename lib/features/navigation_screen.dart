import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/helpers/spacing.dart';
import '../core/theme/color_manager.dart';
import 'cart/account/account_screen.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const AccountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 20.w,
        ),
        color: ColorManager.moreLighterGray.withOpacity(0.8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomBottomNavigationItem(
              label: 'Home',
              svgIcon: 'assets/icons/home.svg',
              index: 0,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            horizontalSpace(40.w),
            CustomBottomNavigationItem(
              label: 'Cart',
              svgIcon: 'assets/icons/cart.svg',
              index: 1,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            horizontalSpace(40.w),
            CustomBottomNavigationItem(
              label: 'Account',
              svgIcon: 'assets/icons/user.svg',
              index: 2,
              currentIndex: _currentIndex,
              onTap: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
      body: screens[_currentIndex],
    );
  }
}

class CustomBottomNavigationItem extends StatelessWidget {
  final String label;
  final String svgIcon;
  final int index;
  final int currentIndex;
  final VoidCallback? onTap;

  const CustomBottomNavigationItem({
    super.key,
    required this.label,
    required this.svgIcon,
    required this.index,
    required this.currentIndex,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgIcon,
            colorFilter: ColorFilter.mode(
              currentIndex == index
                  ? ColorManager.mainBlue
                  : ColorManager.lighterGray,
              BlendMode.srcIn,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: currentIndex == index
                  ? ColorManager.mainBlue
                  : ColorManager.lighterGray,
            ),
          ),
        ],
      ),
    );
  }
}
