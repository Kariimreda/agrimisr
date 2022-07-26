import 'package:agrimisr/Layout/Ui/Layout.dart';
import 'package:agrimisr/Modules/Ui/splashScreen.dart';
import 'package:agrimisr/account/screens/edit_info_screen.dart';
import 'package:agrimisr/account/screens/my_account_screen.dart';
import 'package:agrimisr/auth/screens/forgot_password_screen.dart';
import 'package:agrimisr/auth/screens/login_screen.dart';
import 'package:agrimisr/auth/screens/signup_screen.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // hasInternet ? hasInternet = true : hasInternet = false;

  runApp(
    EasyLocalization(
      supportedLocales: MyLocales.supportedLocales,
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: MyLocales.supportedLocales[0],
      startLocale: MyLocales.supportedLocales[0],
      child: Phoenix(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: OverlaySupport.global(
        child: RestartWidget(
          child: GetMaterialApp(
            theme: ThemeData(
              primarySwatch: MyColors.primaryMaterialColor.mdColor,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            getPages: [
              GetPage(
                name: LoginScreen.routeName,
                page: () => const LoginScreen(),
              ),
              GetPage(
                name: SignupScreen.routeName,
                page: () => const SignupScreen(),
              ),
              GetPage(
                name: ForgotPasswordScreen.routeName,
                page: () => const ForgotPasswordScreen(),
              ),
              GetPage(
                name: Layout.routeName,
                page: () => const Layout(),
              ),
              GetPage(
                name: SplashScreen.routeName,
                page: () => const SplashScreen(),
              ),
              GetPage(
                name: AccountScreen.routeName,
                page: () => const AccountScreen(),
              ),
              GetPage(
                name: EditInfoScreen.routeName,
                page: () => const EditInfoScreen(),
              ),
              // GetPage(
              //   name: InternetError.routeName,
              //   page: () => InternetError(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class RestartWidget extends StatefulWidget {
  const RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<RestartWidgetState>()?.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
