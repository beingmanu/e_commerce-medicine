import 'package:flutter/material.dart';

class AppThemeData extends ChangeNotifier {
  bool darkMode = false;
  String fontFamily = "Robot";

  // Colors
  Color darkColor = const Color(0xff0f3242);
  Color lightColor = const Color(0xfff2fafd);

  Color gDarkColor = const Color(0xffe3f3fb);

  Color gLightColor = const Color.fromARGB(128, 21, 108, 143);

  Color primaryColor = const Color(0xff0f3242);
  Color companionColor01 = const Color(0xffc6e9f6);
  Color companionColor02 = const Color(0xff156d8f);
  // Color companionColor03 = const Color(0xffF5F6F6);
  // Color companionColor04 = const Color(0xffF5F6F6);

  Color? colorBG;
  Color? tCGray;
  Color? tCDefault;
  Color? tCReverse;
  // Color? colorBGDailog;
  Color? colorButton;
  // Color? colorBgCard;
  MaterialColor? primarySwatch;

  // text Style
  TextStyle? text14;
  TextStyle? text14gray;
  TextStyle? text14bold;
  TextStyle? text16;
  TextStyle? text16gray;
  TextStyle? text16bold;
  TextStyle? text18;
  TextStyle? text18gray;
  TextStyle? text18bold;
  TextStyle? text22;
  TextStyle? text22Bold;
  TextStyle? text22Gray;

  changeDarkMode() {
    darkMode = !darkMode;
    init(darkMode);
  }

  init(bool darkModeInit) {
    darkMode = darkModeInit;
    if (darkMode) {
      colorBG = darkColor;
      tCGray = gDarkColor;
      tCDefault = lightColor;
      tCReverse = darkColor;
      colorButton = primaryColor;
      primarySwatch = black;
    } else {
      colorBG = lightColor;
      tCGray = gLightColor;
      tCDefault = darkColor;
      tCReverse = lightColor;
      colorButton = primaryColor;
      primarySwatch = white;
    }
    text14 = TextStyle(
        fontSize: 14,
        color: tCDefault,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w100);
    text14gray = TextStyle(fontSize: 14, color: tCGray, fontFamily: fontFamily);
    text14bold = TextStyle(
        fontSize: 14,
        color: tCDefault,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800);

    text16 = TextStyle(fontSize: 16, color: tCDefault, fontFamily: fontFamily);
    text16gray = TextStyle(fontSize: 16, color: tCGray, fontFamily: fontFamily);
    text16bold = TextStyle(
        fontSize: 16,
        color: tCDefault,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800);

    text18 = TextStyle(fontSize: 18, color: tCDefault, fontFamily: fontFamily);
    text18gray = TextStyle(fontSize: 18, color: tCGray, fontFamily: fontFamily);
    text18bold = TextStyle(
        fontSize: 18,
        color: tCDefault,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800);

    text22 = TextStyle(fontSize: 22, color: tCDefault, fontFamily: fontFamily);
    text22Bold =
        TextStyle(fontSize: 22, color: tCDefault, fontFamily: fontFamily);
    text22Gray = TextStyle(
        fontSize: 22,
        color: tCGray,
        fontFamily: fontFamily,
        fontWeight: FontWeight.w800);

    notifyListeners();
  }
}

const MaterialColor white = MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

const MaterialColor black = MaterialColor(
  0xFF000000,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(0xFF000000),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
