import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/header.dart';
import '../widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: 'Recommended for\nyour devices',
              actionText: 'See All',
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: ProductCard(product: Product.airPodsMax),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
