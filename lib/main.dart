import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:psiko/Entity/Entity.dart';
import 'package:psiko/Entity/InfoEntity.dart';
import 'package:psiko/Page/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Lottie.asset("asset/giris.json"),
        duration:2000,
        animationDuration: Duration(milliseconds: 440),
        splashIconSize: 500,
        nextScreen: HomePage(),
      ),
    );
  }
}


