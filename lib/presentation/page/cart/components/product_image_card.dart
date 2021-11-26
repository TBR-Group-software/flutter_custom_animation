import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

class ProductImageCard extends StatelessWidget {
  final Product product;

  const ProductImageCard({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: AppPalette.litePink,
        borderRadius: BorderRadius.circular(18),
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 40,
          maxHeight: 100,
        ),
        child: Image.asset(
          product.images.first,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
