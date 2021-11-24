import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/initial_animation.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/product_animation.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/value_switch.dart';

import 'components/bottom_row.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  const ProductPage({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey<String>(widget.product.id),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          ProductAnimation(
            controller: _animationController,
            product: widget.product,
          ),
          ProductInitialAnimation(
            onAnimationFinished: () {},
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ProductBottomRow(),
          ),
          Positioned(
            top: 11,
            right: 29,
            child: SafeArea(
              child: ValueSwitch(
                controller: _animationController,
                fistValue: 300,
                secondValue: 150,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
