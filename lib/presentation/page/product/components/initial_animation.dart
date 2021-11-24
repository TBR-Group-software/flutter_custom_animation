import 'package:flutter/material.dart';

class ProductInitialAnimation extends StatefulWidget {
  final VoidCallback onAnimationFinished;

  const ProductInitialAnimation({required this.onAnimationFinished, Key? key})
      : super(key: key);

  @override
  State<ProductInitialAnimation> createState() =>
      _ProductInitialAnimationState();
}

class _ProductInitialAnimationState extends State<ProductInitialAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _secondScaleController;

  @override
  void initState() {
    super.initState();
    _secondScaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _secondScaleController.forward();
  }

  Widget _build(Animation<double> animation, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: ScaleTransition(
        scale: animation,
        child: Container(
          width: 10,
          height: 10,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _build(
      _secondScaleController.drive(
        Tween<double>(end: 0, begin: 200),
      ),
      Alignment.bottomRight,
    );
  }

  @override
  void dispose() {
    _secondScaleController.dispose();
    super.dispose();
  }
}
