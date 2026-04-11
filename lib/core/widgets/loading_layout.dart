import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../theme/color_manager.dart';

class LoadingLayout {
  LoadingLayout._();

  static Future<dynamic> setupLogin(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      barrierColor: ColorManager.moreLighterGray.withOpacity(0.7),
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Lottie.asset(
            'assets/lottie/loading.json',
            width: 250,
            height: 250,
          ),
        );
      },
    );
  }
}
