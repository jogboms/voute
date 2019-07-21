import 'package:flutter/material.dart' show MaterialColor;
import 'package:flutter/widgets.dart';

class MkColors {
  MkColors._();
  static const _basePrimary = 0xFF26D1F6;
  static const _baseAccent = 0xFF26f6b4;
  static const MaterialColor dark = const MaterialColor(
    0xFF444444,
    const <int, Color>{
      50: const Color(0xFFfafafa),
      100: const Color(0xFFf5f5f5),
      200: const Color(0xFFefefef),
      300: const Color(0xFFe2e2e2),
      400: const Color(0xFFbfbfbf),
      500: const Color(0xFFa0a0a0),
      600: const Color(0xFF777777),
      700: const Color(0xFF636363),
      800: const Color(0xFF444444),
      900: const Color(0xFF232323),
    },
  );
  static const MaterialColor white = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFfafafa),
      200: const Color(0xFFf5f5f5),
      300: const Color(0xFFf0f0f0),
      400: const Color(0xFFdedede),
      500: const Color(0xFFc2c2c2),
      600: const Color(0xFF979797),
      700: const Color(0xFF818181),
      800: const Color(0xFF606060),
      900: const Color(0xFF3c3c3c),
    },
  );
  static const MaterialColor base_primary = const MaterialColor(
    _basePrimary,
    const <int, Color>{
      50: const Color(0xFFdff7fe),
      100: const Color(0xFFaeebfc),
      200: const Color(0xFF75defa),
      300: const Color(_basePrimary),
      400: const Color(0xFF00c6f2),
      500: const Color(0xFF00bceb),
      600: const Color(0xFF00acd7),
      700: const Color(0xFF0097bb),
      800: const Color(0xFF0084a2),
      900: const Color(0xFF006174),
    },
  );
  static const MaterialColor base_accent = const MaterialColor(
    _baseAccent,
    const <int, Color>{
      50: const Color(0xFFd8feed),
      100: const Color(0xFF9cfad2),
      200: const Color(_baseAccent),
      300: const Color(0xFF00ef98),
      400: const Color(0xFF00e584),
      500: const Color(0xFF00db70),
      600: const Color(0xFF00ca64),
      700: const Color(0xFF00b655),
      800: const Color(0xFF00a448),
      900: const Color(0xFF008231),
    },
  );
  static const Color accent = const Color(_baseAccent);
  static const Color primary = const Color(_basePrimary);
  static const Color light_grey = const Color(0xFFB2B2B2);
  static const Color smoke = const Color(0xFFF6F6F6);
  static const Color smokey = const Color(0xFFE6E6E6);
  static const Color success = const Color(0xFF7ED321);
  static const Color danger = const Color(0xFFEB5757);
  static const Color info = const Color(0xFF2D9CDB);
  static const Color warning = const Color(0xFFF1B61E);
  static const Color gold = const Color(0xFFD58929);
  static const Color gradient_start = const Color(0xFF14F4F4);
  static const Color gradient_end = const Color(0xFF26D1F6);
}
