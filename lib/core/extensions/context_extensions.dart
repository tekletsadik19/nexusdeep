import 'package:flutter/material.dart';
import 'package:nexusdeep/core/enum/user/user_role.dart';
import 'package:nexusdeep/core/res/app_theme.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => CoreTheme.getThemeData(this);
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;
  double get width => size.width;
  double get height => size.height;
}

extension UserRoleExtension on UserRole {
  static UserRole fromString(String role) {
    return UserRole.values.firstWhere(
          (e) => e.toString().split('.').last == role,
      orElse: () => UserRole.user,
    );
  }
}
