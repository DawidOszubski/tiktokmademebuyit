import 'package:flutter/material.dart';
import 'package:tiktokmademebuyit/constants/app_colors.dart';

class AppThemes {
  static final darkTheme = ThemeData(
    backgroundColor: AppColors.black,
    primaryColor: Colors.white,
    /*textTheme: TextTheme(
      headline1: TextStyle(color: Colors.deepPurpleAccent),
      headline2: TextStyle(color: Colors.deepPurpleAccent),
      bodyText2: TextStyle(color: Colors.deepPurpleAccent),
      subtitle1: TextStyle(color: Colors.pinkAccent),
    ),*/
  );

  static final lightTheme = ThemeData(
    backgroundColor: Colors.white,
  );
}
