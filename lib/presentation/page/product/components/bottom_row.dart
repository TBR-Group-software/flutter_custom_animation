import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/count_chooser.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class ProductBottomRow extends StatelessWidget {
  const ProductBottomRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const CountChooser(),
            const Text(
              'Add To Bag',
              style: AppTextStyles.playfairDisplayRegular24Black,
            ),
          ],
        ),
      ),
    );
  }
}
