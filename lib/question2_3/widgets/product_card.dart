import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161616),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          _buildBookmarkIcon(),
          _buildProductImage(),
          _buildProductInfo(),
          _buildColorOptions(),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  // Bookmark icon in top-right corner
  Widget _buildBookmarkIcon() {
    return const Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Icon(Icons.bookmark_border, color: Colors.blue, size: 28),
      ),
    );
  }

  // Product image section
  Widget _buildProductImage() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              product.imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }

  // Product information section
  Widget _buildProductInfo() {
    return Column(
      children: [
        if (product.hasEngraving)
          const Text(
            'Free Engraving',
            style: TextStyle(color: Colors.orange, fontSize: 14),
          ),
        const SizedBox(height: 8),
        Text(
          product.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          product.price,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Color options section
  Widget _buildColorOptions() {
    const maxDisplayed = 4;
    final hasMore = product.colors.length > maxDisplayed;
    final displayedColors = product.colors.take(maxDisplayed).toList();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < displayedColors.length; i++)
          _buildColorOption(
            displayedColors[i],
            isSelected: i == product.selectedColorIndex,
          ),
        if (hasMore)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              '+${product.colors.length - maxDisplayed} more',
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
      ],
    );
  }

  // Individual color selection circle
  Widget _buildColorOption(Color color, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.blue, width: 2) : null,
      ),
    );
  }
}
