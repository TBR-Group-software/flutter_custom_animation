import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class LogoCircle extends StatelessWidget {
  const LogoCircle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 74,
      height: 74,
      decoration: const BoxDecoration(
        color: AppPalette.liteRed,
        shape: BoxShape.circle,
      ),
      child: const Center(
        child: Text(
          'N8',
          style: AppTextStyles.playfairDisplay22RegularWhite,
        ),
      ),
    );
  }
}
