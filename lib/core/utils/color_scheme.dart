import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    _instace ??= ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color orange = const Color(0xffFF660E);

  final Color black = const Color(0xff202020);

  final Color mediumGrey = const Color(0xffF3F1F1);
  final Color lightGrey = const Color(0xffF8F8F8);
  final Color darkGrey = const Color(0xff9A9A9A);
}
