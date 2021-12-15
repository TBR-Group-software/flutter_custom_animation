import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/home/components/image_with_blur.dart';

class ProductImage extends StatefulWidget {
  final Product product;
  final AnimationController? controller;

  const ProductImage({required this.product, this.controller, Key? key})
      : super(key: key);

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool _blurred = true;

  void _controllerListener() {
    if (_animationController.value == _animationController.upperBound) {
      setState(() {
        _blurred = false;
      });
    } else if (!_blurred) {
      setState(() {
        _blurred = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _animationController = widget.controller!;
    } else {
      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      );
    }
    _animationController.addListener(_controllerListener);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 40),
              child: SlideTransition(
                position: _animationController.drive(
                    Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.10, 0))),
                child: ScaleTransition(
                  scale: _animationController
                      .drive(Tween<double>(begin: 1, end: 1.2)),
                  child: RotationTransition(
                    alignment: Alignment.bottomCenter,
                    turns: _animationController
                        .drive(Tween<double>(begin: 0, end: -0.028)),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.8,
                      height: constraints.maxHeight * 0.8,
                      child: ImageWithBlur(
                        image: widget.product.images.first,
                        blurred: _blurred,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity:
                  _animationController.drive(Tween<double>(begin: 1, end: 0)),
              child: RotationTransition(
                turns: _animationController
                    .drive(Tween<double>(begin: 0, end: -0.05)),
                alignment: Alignment.bottomCenter,
                child: SlideTransition(
                  position: _animationController.drive(
                      Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.5, 0))),
                  child: Image.asset(
                    widget.product.images.first,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    //_animationController.dispose();
    super.dispose();
  }
}
