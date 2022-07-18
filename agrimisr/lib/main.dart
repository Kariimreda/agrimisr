import 'package:agrimisr/auth/screens/login_screen.dart';
import 'package:agrimisr/core/locales.dart';

import 'package:agrimisr/style/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: MyLocales.supportedLocales,
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: MyLocales.supportedLocales[0],
        startLocale: MyLocales.supportedLocales[0],
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: MyColors.primaryMaterialColor.mdColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.routeName,
      getPages: [
        GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
      ],
    );
  }
}
