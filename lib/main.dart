import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_animation/backbone/dependency_injection.dart'
    as di;
import 'package:flutter_custom_animation/presentation/page/home/page.dart';
import 'package:flutter_custom_animation/presentation/page/splash/page.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/utils/material_color_from_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: <SystemUiOverlay>[SystemUiOverlay.bottom, SystemUiOverlay.top]);
  di.init();
  runApp(const FlutterCustomAnimationsApp());
}

class FlutterCustomAnimationsApp extends StatelessWidget {
  const FlutterCustomAnimationsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock app initialization
    return FutureBuilder<dynamic>(
      future: Init.instance.initialize(),
      builder: (_, AsyncSnapshot<dynamic> snapshot) {
        // Show splash screen while waiting for app resources to load:
        if (snapshot.connectionState == ConnectionState.waiting) {
          SystemChrome.setSystemUIOverlayStyle(
              const SystemUiOverlayStyle(statusBarColor: Colors.black));
          return const SplashPage();
        } else {
          // Loading is done, return the app:
          return MaterialApp(
            title: 'Flutter Custom Animations',
            theme: ThemeData(
              primarySwatch: AppPalette.liteRed.createMaterialColor(),
            ),
            home: HomePage(
              bloc: di.sl.get(),
            ),
          );
        }
      },
    );
  }
}

class Init {
  Init._();

  static final Init instance = Init._();

  Future<void> initialize() async {
    await Future<void>.delayed(const Duration(seconds: 3));
  }
}
