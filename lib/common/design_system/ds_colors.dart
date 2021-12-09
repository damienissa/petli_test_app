import 'package:flutter/widgets.dart';

abstract class DSColors {
  static const background = Color(0xFF5C3C61);
  static const accent = Color(0xFFFF99AF);
  static const darkText = Color(0xFF2A1D2C);
  static const white = Color(0xFFFFFFFF);
  static const lightOrange = Color(0xFFFDEEE2);
  static const backgroundGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFFDEEE2)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
