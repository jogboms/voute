import 'package:flutter/material.dart' show MaterialColor;
import 'package:flutter/widgets.dart';

class MkColors {
  MkColors._();
  static const _basePrimary = 0xFF26D1F6;
  static const _baseAccent = 0xFF26f6b4;
  static const MaterialColor dark = MaterialColor(
    0xFF444444,
    <int, Color>{
      50: Color(0xFFfafafa),
      100: Color(0xFFf5f5f5),
      200: Color(0xFFefefef),
      300: Color(0xFFe2e2e2),
      400: Color(0xFFbfbfbf),
      500: Color(0xFFa0a0a0),
      600: Color(0xFF777777),
      700: Color(0xFF636363),
      800: Color(0xFF444444),
      900: Color(0xFF232323),
    },
  );
  static const MaterialColor white = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFfafafa),
      200: Color(0xFFf5f5f5),
      300: Color(0xFFf0f0f0),
      400: Color(0xFFdedede),
      500: Color(0xFFc2c2c2),
      600: Color(0xFF979797),
      700: Color(0xFF818181),
      800: Color(0xFF606060),
      900: Color(0xFF3c3c3c),
    },
  );
  static const MaterialColor base_primary = MaterialColor(
    _basePrimary,
    <int, Color>{
      50: Color(0xFFdff7fe),
      100: Color(0xFFaeebfc),
      200: Color(0xFF75defa),
      300: Color(_basePrimary),
      400: Color(0xFF00c6f2),
      500: Color(0xFF00bceb),
      600: Color(0xFF00acd7),
      700: Color(0xFF0097bb),
      800: Color(0xFF0084a2),
      900: Color(0xFF006174),
    },
  );
  static const MaterialColor base_accent = MaterialColor(
    _baseAccent,
    <int, Color>{
      50: Color(0xFFd8feed),
      100: Color(0xFF9cfad2),
      200: Color(_baseAccent),
      300: Color(0xFF00ef98),
      400: Color(0xFF00e584),
      500: Color(0xFF00db70),
      600: Color(0xFF00ca64),
      700: Color(0xFF00b655),
      800: Color(0xFF00a448),
      900: Color(0xFF008231),
    },
  );
  static const Color accent = Color(_baseAccent);
  static const Color primary = Color(_basePrimary);
  static const Color light_grey = Color(0xFFB2B2B2);
  static const Color smoke = Color(0xFFF6F6F6);
  static const Color smokey = Color(0xFFE6E6E6);
  static const Color success = Color(0xFF7ED321);
  static const Color danger = Color(0xFFEB5757);
  static const Color info = Color(0xFF2D9CDB);
  static const Color warning = Color(0xFFF1B61E);
  static const Color gold = Color(0xFFD58929);
  static const Color gradient_start = Color(0xFF14F4F4);
  static const Color gradient_end = Color(0xFF26D1F6);
}
