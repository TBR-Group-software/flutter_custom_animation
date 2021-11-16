import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/image_with_blur.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/product_top_info.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final bool selected;
  final Product product;

  const ProductCard({required this.product, this.selected = false, Key? key})
      : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      lowerBound: 0.3,
    );
    _scaleAnimation = _animationController.drive(
      CurveTween(curve: Curves.easeInOutBack),
    );
    _opacityAnimation = _animationController;
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        alignment: Alignment.bottomRight,
        child: Container(
          width: 238,
          height: 375,
          margin: const EdgeInsets.only(bottom: 30),
          padding: const EdgeInsets.all(29),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: <BoxShadow>[
              if (widget.selected)
                const BoxShadow(
                    color: AppPalette.liteRedWithOpacity,
                    offset: Offset(0, 10),
                    blurRadius: 15),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              ProductCardTopInfo(
                product: widget.product,
              ),
              const SizedBox(
                height: 17,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 50, top: 40),
                    child: ImageWithBlur(image: widget.product.images.first),
                  ),
                  Image.asset(
                    widget.product.images.first,
                    width: 190,
                    height: 240,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
