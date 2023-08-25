import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:psiko/Page/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp], // Yatay döndürmeyi engeller
  );
  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      title: 'Psiko',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset("asset/giris.json"),
        duration:2000,
        animationDuration: Duration(milliseconds: 500),
        splashIconSize: 500,
        nextScreen: HomePage(),
      ),
    );
  }
}


