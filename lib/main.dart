import 'package:e_commerce/core/di/dependancy_injection.dart';
import 'package:e_commerce/core/networking/api_services.dart';
import 'package:e_commerce/core/networking/dio_factory.dart';
import 'package:flutter/material.dart';

import 'ecommerce_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupGet();
  runApp(const EcommerceApp());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              ApiServices(await DioFactory.getDio())
                  .getProductsByPagination( 50, 10);
            },
            child: const Text('Go to E-commerce App'),
          ),
        ),
      ),
    );
  }
}
