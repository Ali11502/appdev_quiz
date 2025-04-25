import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final List<Color> colors;
  final int selectedColorIndex;
  final bool hasEngraving;

  const Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.colors,
    this.selectedColorIndex = 0,
    this.hasEngraving = false,
  });

  static const airPodsMax = Product(
    name: 'AirPods Max — Silver',
    price: 'A\$899.00',
    imageUrl:
        'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/airpods-max-select-silver-202011?wid=470&hei=556&fmt=png-alpha&.v=1604021221000',
    colors: [
      Colors.black,
      Colors.red,
      Color(0xFFD4E6D9), // Silver-green color
      Colors.white,
      Colors.blue,
    ],
    selectedColorIndex: 2,
    hasEngraving: true,
  );
}
