import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_image.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_swipe_detector.dart';

class ProductImageAnimation extends StatefulWidget {
  final Product product;
  final AnimationController controller;

  const ProductImageAnimation({
    required this.product,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductImageAnimation> createState() => _ProductImageAnimationState();
}

class _ProductImageAnimationState extends State<ProductImageAnimation> {
  @override
  Widget build(BuildContext context) {
    return ProductSwipeGesture(
      controller: widget.controller,
      child: SizedBox(
        width: 170,
        height: 400,
        child: ProductImage(
          controller: widget.controller,
          product: widget.product,
        ),
      ),
    );
  }
}
