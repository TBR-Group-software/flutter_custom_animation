import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_animation/presentation/page/home/page.dart';
import 'package:flutter_custom_animation/presentation/page/splash/page.dart';

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
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
            ),
            //home: const MyHomePage(title: 'Flutter Demo Home Page'),
            home: HomePage(),
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
