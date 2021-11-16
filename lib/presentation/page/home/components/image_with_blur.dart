import 'dart:math' as math;
import 'dart:ui';

import 'package:flutter/material.dart';

class ImageWithBlur extends StatelessWidget {
  final String image;

  const ImageWithBlur({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -math.pi / -18,
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 69.22,
        height: 164,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                color: Colors.white.withOpacity(0.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
