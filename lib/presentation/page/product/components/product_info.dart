import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/presentation/page/product/components/view_more.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class ProductInfo extends StatelessWidget {
  final Product product;

  const ProductInfo({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          product.name,
          style: AppTextStyles.playfairDisplayRegular24White,
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '\$ ${product.price.toStringAsFixed(2)}',
              style: AppTextStyles.display26RegularWhite,
            ),
            const SizedBox(
              width: 13,
            ),
            Text(
              '${product.price.toStringAsFixed(2)} ML',
              style: AppTextStyles.display15RegularWhite,
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Text(
            product.description,
            textAlign: TextAlign.center,
            style: AppTextStyles.display16RegularWhite,
          ),
        ),
        const SizedBox(
          height: 52,
        ),
        const ViewMoreButton(),
      ],
    );
  }
}
