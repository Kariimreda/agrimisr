import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/auth/widgets/password_form.dart';
import 'package:agrimisr/auth/widgets/personal_info_form.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  static const String routeName = '/signup';

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final signupController = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SizedBox(
            height: MySize.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.height * 0.02),
                SizedBox(
                  width: MySize.width * 0.6,
                  height: MySize.height * 0.2,
                  child: Image.asset(MyStrings.logoPath),
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    switchInCurve: Curves.easeInExpo,
                    switchOutCurve: Curves.easeOutExpo,
                    transitionBuilder: (child, animation) {
                      //get text direction from locale
                      return SlideTransition(
                        textDirection: Directionality.of(context),
                        position: Tween<Offset>(
                          begin: const Offset(1.5, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                    //switch case on signupController.state to show the appropriate widget
                    child: signupController.loginState ==
                            LoginState.personalInfo
                        ? PersonalInfoForm(signupController: signupController)
                        : PasswordForm(signupController: signupController),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
