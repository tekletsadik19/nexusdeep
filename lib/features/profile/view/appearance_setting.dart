import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nexusdeep/core/common/app/providers/theme_controller.dart';
import 'package:nexusdeep/core/extensions/context_extensions.dart';
import 'package:nexusdeep/core/res/app_theme.dart';
import 'package:nexusdeep/core/res/media_res.dart';

class AppearanceSetting extends StatefulWidget {
  const AppearanceSetting({super.key});

  @override
  State<AppearanceSetting> createState() => _AppearanceSettingState();
}

class _AppearanceSettingState extends State<AppearanceSetting> {
  ThemeMode? _themeMode;
  final ThemeController _themeController = Get.find();


  @override
  void initState() {
    super.initState();
    _themeMode = CoreTheme.themeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 70,
        title: Text(
          'Appearance',
          style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            FontAwesomeIcons.arrowLeft,
          ),
          onPressed: () => context.go('/profile-screen'),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("H");
                        }
                      },
                      child: SvgPicture.asset(
                        MediaRes.phoneLightMode,
                        width: 200,
                      ),
                    ),
                    Radio(
                      value: ThemeMode.light,
                      groupValue: _themeMode,
                      onChanged: (ThemeMode? mode) {
                        if (mode != null) {
                          setState(() {
                            _themeMode = mode;
                          });
                          _themeController.changeTheme(mode);
                        }
                      },
                    ),
                    Text(
                      'Light',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print("I");
                        }
                      },
                      child: SvgPicture.asset(
                        MediaRes.phoneDarkMode,
                        width: 200,
                      ),
                    ),
                    Radio(
                      value: ThemeMode.dark,
                      groupValue: _themeMode,
                      onChanged: (ThemeMode? mode) {
                        if (mode != null) {
                          setState(() {
                            _themeMode = mode;
                          });
                          _themeController.changeTheme(mode);
                        }
                      },
                    ),
                    Text(
                      'Dark',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset(
                        MediaRes.phoneSystemMode,
                        width: 200,
                      ),
                    ),
                    Radio(
                      value: ThemeMode.system,
                      groupValue: _themeMode,
                      onChanged: (ThemeMode? mode) {
                        if (mode != null) {
                          setState(() {
                            _themeMode = mode;
                          });
                          _themeController.changeTheme(mode);
                        }
                      },
                    ),
                    Text(
                      'System',
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

          Align(
            alignment: AlignmentDirectional.topStart,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 20,
                start: 20,
                bottom: 5,
              ),
              child: Text(
                "If 'System' is selected, Nexus Deep app will automatically adjust "
                'your appearance based on your devices system setting',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
