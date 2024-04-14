import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app_project/style/my_colors.dart';

class MyTheme {
  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: MyColors.bgColor,
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.inter(
            fontSize: 22, fontWeight: FontWeight.w400, color: Colors.white),
        bodyMedium: GoogleFonts.inter(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
        bodySmall: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(
          color: MyColors.whiteColor,
          size: 24,
        )
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: MyColors.bottomNavBarBgColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: MyColors.whiteColor.withOpacity(0.75),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: MyColors.primaryColor,
      ));
}
