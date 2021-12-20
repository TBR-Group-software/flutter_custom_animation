import 'package:flutter/material.dart';
import 'package:flutter_custom_animation/backbone/dependency_injection.dart'
    as di;
import 'package:flutter_custom_animation/presentation/bloc/home_page/bloc.dart';
import 'package:flutter_custom_animation/presentation/page/splash/components/logo_animation.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final HomePageBloc bloc = di.sl.get();
    bloc.add(const HomePageEvent.getInitialData());
  }

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
