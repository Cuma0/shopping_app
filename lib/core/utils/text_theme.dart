import 'package:flutter/material.dart';

import 'color_scheme.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight? get instance {
    _instace ??= TextThemeLight._init();
    return _instace;
  }

  TextThemeLight._init();

  final TextStyle titleLarge = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: ColorSchemeLight.instance!.black,
  );

  final TextStyle titleMedium = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    fontSize: 14,
    color: ColorSchemeLight.instance!.black,
  );
  final TextStyle titleSmall = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 12,
    color: ColorSchemeLight.instance!.black,
  );

  final TextStyle bodySmall = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorSchemeLight.instance!.darkGrey,
  );

  final TextStyle bodyMedium = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 14,
    color: ColorSchemeLight.instance!.darkGrey,
  );

  final TextStyle button = const TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.white,
  );
}
