import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ProductCardTopInfo extends StatelessWidget {
  final Product product;

  const ProductCardTopInfo({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          product.name,
          style: AppTextStyles.playfairDisplay15RegularBlack,
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '\$ ${product.price}',
              style: AppTextStyles.display20RegularBlack,
            ),
            Text(
              '${product.volume} ML',
              style: AppTextStyles.display12RegularBlack,
            ),
          ],
        ),
      ],
    );
  }
}
