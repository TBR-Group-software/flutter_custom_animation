import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class TotalCartSum extends StatelessWidget {
  final Cart cart;

  const TotalCartSum({required this.cart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'Total ',
        style: AppTextStyles.playfairDisplayRegular20White,
        children: <TextSpan>[
          TextSpan(
            text: '\$${cart.total.toStringAsFixed(2)}',
            style: AppTextStyles.display30RegularWhite,
          ),
        ],
      ),
    );
  }
}
