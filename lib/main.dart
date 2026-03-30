import 'package:e_commerce/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
      child: MaterialApp.router(
        routerConfig: AppRouter.generateRoute,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'ReadexPro',
          useMaterial3: true,
        ),
      ),
    );
  }
}
