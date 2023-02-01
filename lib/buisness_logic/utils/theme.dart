import 'package:flutter/material.dart';

class InfiThemes {
  static const Color _lightCursorColor = Color(0xff34AD64);
  static const Color _lightAccentColor = Color(0xff34AD64);
  static const Color _lightPrimaryColor = Color(0xFF7555CF);
  static const Color _lightIconColor = Color(0xff8C8E8D);

  static final lightTheme = ThemeData(
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: _lightCursorColor,
    ),
    primaryColor: _lightPrimaryColor,
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    fontFamily: 'product-sans',
    textTheme: _lightTextTheme,
    colorScheme: const ColorScheme.light(
      primary: _lightAccentColor,
      secondary: Color(0xffF5F5F5),
    ).copyWith(secondary: _lightAccentColor),
  );

  static const TextTheme _lightTextTheme = TextTheme(
    headline2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 22,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 15,
      color: Colors.black38,
    ),
    headline6: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontSize: 22.0,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 12.0,
    ),
  );
}
