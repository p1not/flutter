import 'package:flutter/material.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    print('product_manager widget - build()');
    return Column(
      children: [
      ]
    );
  }
}
