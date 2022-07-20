import 'package:flutter/material.dart';

/*
 * To use just simple provide the RGB value and call the mdColor straight up
 * e.g. CustomMaterialColor(88, 207, 194).mdColor
 */
class CustomMaterialColor {
  final int r;
  final int g;
  final int b;

  CustomMaterialColor(this.r, this.g, this.b);

  MaterialColor get mdColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(r, g, b, .1),
      100: Color.fromRGBO(r, g, b, .2),
      200: Color.fromRGBO(r, g, b, .3),
      300: Color.fromRGBO(r, g, b, .4),
      400: Color.fromRGBO(r, g, b, .5),
      500: Color.fromRGBO(r, g, b, .6),
      600: Color.fromRGBO(r, g, b, .7),
      700: Color.fromRGBO(r, g, b, .8),
      800: Color.fromRGBO(r, g, b, .9),
      900: Color.fromRGBO(r, g, b, 1),
    };
    return MaterialColor(Color.fromRGBO(r, g, b, 1).value, color);
  }
}

//my colors class for the app
class MyColors {
  static const Color primary = Color.fromARGB(255, 93, 158, 55);
  static const Color primaryDark = Color.fromARGB(255, 66, 87, 72);
  static const Color secondary = Color.fromARGB(255, 182, 138, 34);
  static Color background = Color.fromARGB(255, 231, 245, 230);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color transparent = Colors.transparent;
  static const Color error = Colors.red;
  static final Color? grey = Colors.grey[600];

  static final CustomMaterialColor primaryMaterialColor =
      CustomMaterialColor(93, 158, 55);
}
