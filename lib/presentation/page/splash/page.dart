import 'package:flutter_custom_animation/presentation/page/splash/components/logo_animation.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppPalette.litePink,
        body: LogoAnimation(),
      ),
    );
  }
}
