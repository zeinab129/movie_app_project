import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_project/data/provider/my_provider.dart';
import 'package:movie_app_project/style/my_theme.dart';
import 'package:movie_app_project/view/screens/home/home_screen.dart';
import 'package:movie_app_project/view/screens/movie_details_sreen.dart';
import 'package:movie_app_project/view/screens/spalsh_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        theme: MyTheme.appTheme,
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          MovieDetailsScreen.routeName: (context) => const MovieDetailsScreen()
        },
      ),
    );
  }
}
