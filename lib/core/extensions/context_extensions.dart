import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexusdeep/core/res/app_theme.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => CoreTheme.getThemeData(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;


}
