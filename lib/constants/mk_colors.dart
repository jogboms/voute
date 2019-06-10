import 'package:flutter/material.dart' show MaterialColor;
import 'package:flutter/widgets.dart';

class MkColors {
  MkColors._();
  static const _basePrimary = 0xFF059200;
  static const _baseAccent = 0xFFFFB024;
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
      50: const Color(0xFFe7f6e5),
      100: const Color(0xFFc5e8c0),
      200: const Color(0xFF9ed997),
      300: const Color(0xFF75ca6b),
      400: const Color(0xFF53bf48),
      500: const Color(0xFF2bb31e),
      600: const Color(0xFF1ea413),
      700: const Color(_basePrimary),
      800: const Color(0xFF008100),
      900: const Color(0xFF006200),
    },
  );
  static const MaterialColor base_accent = const MaterialColor(
    _baseAccent,
    const <int, Color>{
      50: const Color(0xFFfffee8),
      100: const Color(0xFFfffac4),
      200: const Color(0xFFfef69c),
      300: const Color(0xFFfdf274),
      400: const Color(0xFFfaed52),
      500: const Color(0xFFf8e830),
      600: const Color(0xFFffde35),
      700: const Color(0xFFffc72d),
      800: const Color(_baseAccent),
      900: const Color(0xFFfc8513),
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
  static const Color gradient_start = const Color(0xFF8CC63F);
  static const Color gradient_end = const Color(0xFF009245);
}
