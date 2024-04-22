import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class CoreTheme {
  ThemeData get themeData;

  Color get primaryColor;
  Color get secondaryColor;
  Color get backgroundColor;
  Color get secondaryBackgroundColor;
  Color get errorColor;
  Color get warningColor;
  Color get helpColor;
  Color get tFieldPrimary;

  static Future<SharedPreferences> initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static ThemeData getThemeData(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.dark ? DarkModeTheme().themeData : LightModeTheme().themeData;
  }
}

class LightModeTheme extends CoreTheme {
  @override
  Color get primaryColor => const Color(0xFF4CAF50);
  @override
  Color get secondaryColor => const Color(0xff290001);
  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);
  @override
  Color get secondaryBackgroundColor => const Color(0xFFF7F7F7);
  @override
  Color get errorColor => const Color.fromRGBO(216, 0, 50, 1);
  @override
  Color get tFieldPrimary => const Color(0xF1EFEFFF);

  @override
  Color get helpColor => const Color(0xff3282B8);
  @override
  Color get warningColor => const Color(0xffFCA652);

  @override
  ThemeData get themeData => ThemeData(
    primaryColor: primaryColor,
    primaryTextTheme: TextTheme(
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.green, // Example of defining a primary swatch
      secondary: secondaryColor,
      background: backgroundColor,
      onBackground: secondaryBackgroundColor,
      primaryContainer: helpColor,
      secondaryContainer: warningColor,
    ).copyWith(
      error: errorColor,
      tertiaryContainer: tFieldPrimary,
    ),
  );



}

class DarkModeTheme extends CoreTheme {
  @override
  Color get primaryColor => const Color(0xFF4CAF50);
  @override
  Color get secondaryColor => const Color(0xfff7ccac);
  @override
  Color get secondaryBackgroundColor => const Color.fromRGBO(4, 13, 18, 1);
  @override
  Color get backgroundColor => const Color.fromRGBO(4, 13, 18, 1);
  @override
  Color get errorColor => const Color.fromRGBO(216, 0, 50, 1);
  @override
  Color get helpColor => const Color(0xff3282B8);
  @override
  Color get warningColor => const Color(0xffFCA652);
  @override
  Color get tFieldPrimary => const Color.fromRGBO(9, 24, 30, 1);



  @override
  ThemeData get themeData => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,

    colorScheme: ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
      onBackground: secondaryBackgroundColor,
      error: errorColor,
      primaryContainer: helpColor,
      secondaryContainer: warningColor,

      tertiaryContainer: tFieldPrimary
    ),
  );
}
