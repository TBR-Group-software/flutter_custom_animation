import 'package:flutter/material.dart';

class ProductSwipeGesture extends StatelessWidget {
  final Widget child;
  final AnimationController controller;
  final bool reversed;

  const ProductSwipeGesture({
    required this.child,
    required this.controller,
    this.reversed = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        // Swiping in right direction.
        if (details.delta.dx > 0) {
          if (reversed) {
            controller.forward();
          } else {
            controller.reverse();
          }
        }

        // Swiping in left direction.
        if (details.delta.dx < 0) {
          if (reversed) {
            controller.reverse();
          } else {
            controller.forward();
          }
        }
      },
      child: child,
    );
  }
}
