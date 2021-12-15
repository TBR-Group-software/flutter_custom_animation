import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/product_image_animation.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/product_info.dart';
import 'package:flutter_custom_animation/presentation/theme/curves.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

class ProductAnimation extends StatefulWidget {
  final Product product;
  final AnimationController controller;

  const ProductAnimation({
    required this.product,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<ProductAnimation> createState() => _ProductAnimationState();
}

class _ProductAnimationState extends State<ProductAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _topSlideController;
  late final AnimationController _bottomSlideController;
  late final AnimationController _opacityController;

  @override
  void initState() {
    super.initState();
    _topSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _bottomSlideController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    _opacityController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _topSlideController.forward();
    _bottomSlideController.forward();
  }

  Widget _buildContainer(Color color, double ratio, Widget child) => Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * ratio,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
        ),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SlideTransition(
          position: _bottomSlideController.drive(Tween<Offset>(
                  begin: const Offset(0, -0.5), end: const Offset(0, 0.8))
              .chain(CurveTween(curve: AppCurves.customCurve))),
          child: _buildContainer(
            AppPalette.liteRed,
            0.5,
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ProductInfo(product: widget.product),
              ),
            ),
          ),
        ),
        SlideTransition(
          position: _topSlideController
              .drive(Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0))),
          child: _buildContainer(Colors.white, 0.5, Container()),
        ),
        SlideTransition(
          position: _topSlideController
              .drive(Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0.15))),
          child: _buildContainer(
              Colors.transparent,
              0.5,
              ProductImageAnimation(
                product: widget.product,
                controller: widget.controller,
              )),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _topSlideController.dispose();
    _bottomSlideController.dispose();
    _opacityController.dispose();
    super.dispose();
  }
}
