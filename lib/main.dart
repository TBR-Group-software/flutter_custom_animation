import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_animation/presentation/page/home/page.dart';
import 'package:flutter_custom_animation/presentation/page/splash/page.dart';
import 'package:flutter_custom_animation/presentation/theme/palette.dart';
import 'package:flutter_custom_animation/presentation/utils/material_color_from_color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(const BeautySalonApp());
}

class BeautySalonApp extends StatelessWidget {
  const BeautySalonApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: AppPalette.liteRed.createMaterialColor(),
            ),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: const HomePage(),
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
