import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/presentation/page/cart/components/product_image_card.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class CartItemWidget extends StatelessWidget {
  final CartProduct product;

  const CartItemWidget({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        ProductImageCard(
          product: product.product,
        ),
        const SizedBox(
          width: 9,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: '${product.amount}x ',
                style: AppTextStyles.display30RegularWhite,
                children: <TextSpan>[
                  TextSpan(
                    style: AppTextStyles.playfairDisplayRegular20White,
                    text: product.product.name,
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                style: AppTextStyles.display22RegularWhite,
                text: '\$${product.product.price} ',
                children: <TextSpan>[
                  TextSpan(
                    style: AppTextStyles.display15RegularWhite,
                    text: '${product.product.volume} ML',
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    );
  }
}
