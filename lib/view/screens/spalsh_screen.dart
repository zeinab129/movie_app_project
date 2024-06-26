import 'package:flutter/material.dart';
import 'package:movie_app_project/view/screens/home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "SPLASH_SCREEN";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
    return Image.asset("assets/images/splash.png");
  }
}
