import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nexusdeep/core/common/app/providers/theme_controller.dart';
import 'package:nexusdeep/core/common/app/providers/user_provider.dart';
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/core/services/injection_container.dart';
import 'package:nexusdeep/core/services/route.dart';
import 'package:nexusdeep/core/utils/constants.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return ChangeNotifierProvider(
      create: (_) => UserProvider(sl<UserSession>()),
      child: GetMaterialApp.router(
        title: kAppName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
        ),

        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
        ),
        themeMode: themeController.currentTheme.value,
        routeInformationParser: router.routeInformationParser,

        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
