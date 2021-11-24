import 'dart:math' as math;

import 'package:blur/blur.dart';
import 'package:flutter/material.dart';

class ImageWithBlur extends StatelessWidget {
  final String image;
  final bool blurred;

  const ImageWithBlur({required this.image, this.blurred = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / -18,
      alignment: Alignment.bottomCenter,
      child: Center(
        child: Image.asset(
          image,
          fit: BoxFit.scaleDown,
        ).blurred(blur: blurred ? 2 : 0, colorOpacity: 0),
      ),
    );
  }
}
