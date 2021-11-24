import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

class AppTextStyles {
  static const TextStyle playfairDisplay22RegularWhite = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 22,
    fontWeight: FontWeight.normal,
    color: Colors.white,
  );

  static const TextStyle playfairDisplay22RegularGray = TextStyle(
    fontFamily: 'PlayfairDisplay',
    fontSize: 15,
    fontWeight: FontWeight.normal,
    color: AppPalette.gray,
  );

  static const TextStyle playfairDisplay22RegularLiteRed = TextStyle(
      color: AppPalette.liteRed,
      fontFamily: 'PlayfairDisplay',
      fontSize: 22,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle playfairDisplay22RegularPink = TextStyle(
      color: AppPalette.pink,
      fontFamily: 'PlayfairDisplay',
      fontSize: 22,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle playfairDisplay15RegularBlack = TextStyle(
      color: AppPalette.black,
      fontFamily: 'PlayfairDisplay',
      fontSize: 15,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display20RegularBlack = TextStyle(
      color: AppPalette.black,
      fontFamily: 'SFProDisplay',
      fontSize: 20,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display12RegularBlack = TextStyle(
      color: AppPalette.black,
      fontFamily: 'SFProDisplay',
      fontSize: 12,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle playfairDisplayRegular15White = TextStyle(
      color: Colors.white,
      fontFamily: 'PlayfairDisplay',
      fontSize: 15,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle playfairDisplayRegular24Black = TextStyle(
      color: AppPalette.black,
      fontFamily: 'PlayfairDisplay',
      fontSize: 24,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle playfairDisplayRegular24White = TextStyle(
      color: Colors.white,
      fontFamily: 'PlayfairDisplay',
      fontSize: 24,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display26RegularWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'SFProDisplay',
      fontSize: 26,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display15RegularWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'SFProDisplay',
      fontSize: 15,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display16RegularWhite = TextStyle(
      color: Colors.white,
      fontFamily: 'SFProDisplay',
      fontSize: 16,
      letterSpacing: -0.30000001192092896,
      fontWeight: FontWeight.normal,
      height: 1);

  static const TextStyle display10RegularWhite = TextStyle(
      color: Color.fromRGBO(255, 245, 245, 1),
      fontFamily: 'SFProDisplay',
      fontSize: 10,
      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
      fontWeight: FontWeight.normal,
      height: 1);
}
