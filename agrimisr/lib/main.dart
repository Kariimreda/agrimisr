import 'package:agrimisr/Layout/Ui/Layout.dart';
import 'package:agrimisr/Modules/Ui/splashScreen.dart';
import 'package:agrimisr/account/screens/edit_info_screen.dart';
import 'package:agrimisr/account/screens/my_account_screen.dart';
import 'package:agrimisr/auth/screens/forgot_password_screen.dart';
import 'package:agrimisr/auth/screens/login_screen.dart';
import 'package:agrimisr/auth/screens/signup_screen.dart';
import 'package:agrimisr/category/screens/category_screen.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:agrimisr/product/screens/product_screen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/widgets/restartAppWidget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  // whenever your initialization is completed, remove the splash screen:
  runApp(
    EasyLocalization(
      supportedLocales: MyLocales.supportedLocales,
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: MyLocales.supportedLocales[0],
      startLocale: MyLocales.supportedLocales[0],
      child: Phoenix(
        child: const MyApp(),
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
              transition: Transition.leftToRightWithFade,
            ),
            GetPage(
              name: ForgotPasswordScreen.routeName,
              page: () => const ForgotPasswordScreen(),
              transition: Transition.leftToRightWithFade,
            ),
            GetPage(
              name: Layout.routeName,
              page: () => const Layout(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: SplashScreen.routeName,
              page: () => const SplashScreen(),
              transition: Transition.fade,
            ),
            GetPage(
              name: AccountScreen.routeName,
              page: () => const AccountScreen(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: EditInfoScreen.routeName,
              page: () => const EditInfoScreen(),
              transition: Transition.downToUp,
            ),
            GetPage(
              name: ProductScreen.routeName,
              page: () => const ProductScreen(),
              transition: Transition.zoom,
            ),
            GetPage(
              name: CategoryScreen.routeName,
              page: () => const CategoryScreen(),
              transition: Transition.downToUp,
            )
          ],
        ),
      ),
    );
  }
}
