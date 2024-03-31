import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;


abstract class CoreTheme {
  static Future initialize() async =>
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

  static CoreTheme? of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  Color get primaryColor => primary;
  Color get secondaryColor => secondary;
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color accent5;
  late Color accent6;
  late Color accent7;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  String get title1Family => displaySmallFamily;
  TextStyle get title1 => typography.displaySmall;
  String get title2Family => typography.headlineMediumFamily;
  TextStyle get title2 => typography.headlineMedium;
  String get title3Family => typography.headlineSmallFamily;
  TextStyle get title3 => typography.headlineSmall;
  String get subtitle1Family => typography.titleMediumFamily;
  TextStyle get subtitle1 => typography.titleMedium;
  String get subtitle2Family => typography.titleSmallFamily;
  TextStyle get subtitle2 => typography.titleSmall;
  String get bodyText1Family => typography.bodyMediumFamily;
  TextStyle get bodyText1 => typography.bodyMedium;
  String get bodyText2Family => typography.bodySmallFamily;
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => MobileTypography(this);
}



class LightModeTheme extends CoreTheme {
  @override
  Color get primaryColor => primary;
  @override
  Color get secondaryColor => secondary;
  @override
  Color get tertiaryColor => tertiary;
  Color get errorColor => error;

  @override
  late Color primary = const Color(0xFF6F61EF);
  @override
  late Color secondary = const Color(0xff886EE4);
  @override
  late Color tertiary = const Color(0xFFEE8B60);
  @override
  late Color alternate = const Color(0xFFFFFFFF);
  @override
  late Color primaryText = const Color(0xFF15161E);
  @override
  late Color secondaryText = const Color(0xFF606A85);
  @override
  late Color primaryBackground = const Color(0xFFFFFFFF);
  @override
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  @override
  late Color accent1 = const Color(0xff886EE4);
  @override
  late Color accent2 = const Color(0xff886EE4);
  @override
  late Color accent3 = const Color(0xff886EE4);
  @override
  late Color accent4 = const Color(0xff886EE4);
  late Color accent5 = const Color.fromRGBO(216, 0, 50, 1);
  late Color accent6= const Color.fromRGBO(255, 106, 194,1);
  @override
  late Color accent7= const Color.fromRGBO(245, 232, 183,1);
  @override
  late Color success = const Color(0xFF048178);
  @override
  late Color warning = const Color(0xFFD5A453);
  @override
  late Color error = const Color(0xFFFF5963);
  @override
  late Color info = const Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class MobileTypography extends Typography {
  MobileTypography(this.theme);

  final CoreTheme theme;

  @override
  String get displayLargeFamily => 'Outfit';
  @override
  TextStyle get displayLarge => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 48.0,
  );
  @override
  String get displayMediumFamily => 'Outfit';
  @override
  TextStyle get displayMedium => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 36.0,
  );
  @override
  String get displaySmallFamily => 'Outfit';
  @override
  TextStyle get displaySmall => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
  );
  @override
  String get headlineLargeFamily => 'Outfit';
  @override
  TextStyle get headlineLarge => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 28.0,
  );
  @override
  String get headlineMediumFamily => 'Outfit';
  @override
  TextStyle get headlineMedium => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 20.0,
  );
  @override
  String get headlineSmallFamily => 'Outfit';
  @override
  TextStyle get headlineSmall => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );
  @override
  String get titleLargeFamily => 'Outfit';
  @override
  TextStyle get titleLarge => GoogleFonts.getFont(
    'Outfit',
    color: theme.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
  );
  @override
  String get titleMediumFamily => 'Plus Jakarta Sans';
  @override
  TextStyle get titleMedium => GoogleFonts.getFont(
    'Plus Jakarta Sans',
    color: theme.info,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );
  @override
  String get titleSmallFamily => 'Plus Jakarta Sans';
  @override
  TextStyle get titleSmall => GoogleFonts.getFont(
    'Plus Jakarta Sans',
    color: theme.info,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
  );
  @override
  String get labelLargeFamily => 'Outfit';
  @override
  TextStyle get labelLarge => GoogleFonts.getFont(
    'Outfit',
    color: theme.secondaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  @override
  String get labelMediumFamily => 'Outfit';
  @override
  TextStyle get labelMedium => GoogleFonts.getFont(
    'Outfit',
    color: theme.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );
  @override
  String get labelSmallFamily => 'Outfit';
  @override
  TextStyle get labelSmall => GoogleFonts.getFont(
    'Outfit',
    color: theme.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
  @override
  String get bodyLargeFamily => 'Plus Jakarta Sans';
  @override
  TextStyle get bodyLarge => GoogleFonts.getFont(
    'Plus Jakarta Sans',
    color: theme.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
  );
  @override
  String get bodyMediumFamily => 'Plus Jakarta Sans';
  @override
  TextStyle get bodyMedium => GoogleFonts.getFont(
    'Plus Jakarta Sans',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );
  @override
  String get bodySmallFamily => 'Plus Jakarta Sans';
  @override
  TextStyle get bodySmall => GoogleFonts.getFont(
    'Plus Jakarta Sans',
    color: theme.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
}


class DarkModeTheme extends CoreTheme {
  @override
  Color get primaryColor => primary;
  @override
  Color get secondaryColor => secondary;
  @override
  Color get tertiaryColor => tertiary;

  @override
  late Color primary = const Color(0xff886EE4);
  @override
  late Color secondary = const Color(0xff886EE4);
  @override
  late Color tertiary = const Color(0xFFEE8B60);
  @override
  late Color alternate = const Color(0xff886EE4);
  @override
  late Color primaryText = const Color(0xFFFFFFFF);
  @override
  late Color secondaryText = const Color(0xFFA9ADC6);
  @override
  late Color primaryBackground = const Color.fromRGBO(4, 13, 18, 1);
  @override
  late Color secondaryBackground = const Color.fromRGBO(4, 13, 18, 1);
  @override
  late Color accent1 = const Color(0xff886EE4);
  @override
  late Color accent2 = const Color(0xff886EE4);
  @override
  late Color accent3 = const Color(0xB931FCE4);
  @override
  late Color accent4 = const Color(0xff886EE4);
  @override
  late Color accent5 = const Color.fromRGBO(216, 0, 50, 1);
  @override
  late Color accent6= const Color.fromRGBO(255, 106, 194,1);
  @override
  late Color accent7= const Color.fromRGBO(245, 232, 183,1);
  @override
  late Color success = const Color(0xFF048178);
  @override
  late Color warning = const Color(0xFFD5A453);
  @override
  late Color error = const Color(0xFFFF5963);
  @override
  late Color info = const Color(0xFFFFFFFF);



}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily!,
        color: color ?? this.color,
        fontSize: fontSize ?? this.fontSize,
        letterSpacing: letterSpacing ?? this.letterSpacing,
        fontWeight: fontWeight ?? this.fontWeight,
        fontStyle: fontStyle ?? this.fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : copyWith(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
