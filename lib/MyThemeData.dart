import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemeData {
  static const Color lightPrimary = Color(0xff0077B6);
  static const Color lightSecondary = Color(0xff03045E);
  static const Color darkPrimary = Color(0xFF645af0);
  static const Color darkSecondary = Colors.white;

  static ThemeData lightTheme = ThemeData(
      fontFamily: '2',
      dividerColor: lightSecondary,
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400,fontFamily: '2', color: lightPrimary),
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600,fontFamily: '2', color: lightPrimary)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedLabelStyle:
            TextStyle(fontSize: 16, color: MyThemeData.lightPrimary),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        selectedIconTheme: IconThemeData(size: 26),
        unselectedIconTheme: IconThemeData(size: 25),
        selectedItemColor: MyThemeData.lightPrimary,
        unselectedItemColor: Colors.black,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
              seedColor: lightPrimary,
              primary: lightPrimary,
              secondary: lightSecondary,
              onPrimary: Colors.black87,
              onSecondary: Colors.white)
          .copyWith(background: lightPrimary),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: lightPrimary,
              fontSize: 28,
              fontFamily: "2",
              fontWeight: FontWeight.w600),
          shadowColor: Colors.transparent),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          refreshBackgroundColor: Colors.white));

  static ThemeData darkTheme = ThemeData(
      fontFamily: '2',
      dividerColor: darkSecondary,
      textTheme: const TextTheme(
          bodySmall: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, fontFamily: '2',color: darkPrimary),
          headlineSmall: TextStyle(
              fontSize: 25, fontWeight: FontWeight.w600,fontFamily: '2' ,color: darkPrimary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        selectedLabelStyle:
            TextStyle(fontSize: 16, color: MyThemeData.darkPrimary),
        unselectedLabelStyle: TextStyle(fontSize: 12, color: Colors.grey),
        selectedIconTheme:
            IconThemeData(size: 26, color: MyThemeData.darkPrimary),
        unselectedIconTheme: IconThemeData(size: 25, color: Colors.white),
        selectedItemColor: MyThemeData.darkPrimary,
        unselectedItemColor: Colors.white,
      ),
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
              seedColor: darkPrimary,
              primary: darkPrimary,
              secondary: darkSecondary,
              onPrimary: Colors.white,
              onSecondary: Colors.black)
          .copyWith(background: darkPrimary),
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: darkPrimary,
              fontSize: 28,
              fontFamily: "2",
              fontWeight: FontWeight.w600),
          shadowColor: Colors.white),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
          refreshBackgroundColor: Colors.white),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black ));
}
