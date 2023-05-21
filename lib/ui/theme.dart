import 'package:flutter/material.dart';
import 'package:pocket_task/constants/colors.dart';

class Themes{

  static final light = ThemeData(
  primaryColor: tdNavyBlue,
  brightness: Brightness.light,
  );

  static final dark =ThemeData(
  primaryColor: tdGrey,
  brightness: Brightness.dark,
  );
}