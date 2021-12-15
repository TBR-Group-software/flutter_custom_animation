import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class CouponField extends StatelessWidget {
  const CouponField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppPalette.liteRed,
      child: DottedBorder(
        color: Colors.white,
        dashPattern: const <double>[5, 5],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: 'Apply Coupon',
              hintStyle: AppTextStyles.playfairDisplayRegular24White,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
