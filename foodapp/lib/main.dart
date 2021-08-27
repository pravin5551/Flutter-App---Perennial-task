import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/pages/HomePage.dart';
import 'package:foodapp/pages/SignInPage.dart';
import 'package:foodapp/pages/SplashScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Food App',
    theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
    home: AnimatedSplashScreen(splash: Image.asset(
      "assets/images/splash/perennial_pic.jpg",
      height: double.infinity,
      width: double.infinity,
    ),
      nextScreen: HomePage(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Colors.purpleAccent,
      // pageTransitionType: PageTransitionType.scale,
    ),


  ));
}

class PageTransitionType {
}



