import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class Themes{

  static final light = ThemeData(
    backgroundColor:tdNavyBlue ,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: tdNavyBlue, // Light mode AppBar background color
    ),
  );

  static final dark =ThemeData(
    backgroundColor: tdGrey,
    primaryColor: tdGrey,
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: tdGrey, // Dark mode AppBar background color
    ),
  );
}