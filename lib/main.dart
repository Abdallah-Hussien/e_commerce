import 'package:e_commerce/core/di/dependancy_injection.dart';
import 'package:flutter/material.dart';

import 'ecommerce_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGet();
  runApp(const EcommerceApp());
}
