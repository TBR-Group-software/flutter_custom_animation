import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/presentation/theme/text_styles.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      color: Colors.transparent,
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: const Text(
          'Continue',
          style: AppTextStyles.playfairDisplayRegular24Black,
        ),
      ),
    );
  }
}
