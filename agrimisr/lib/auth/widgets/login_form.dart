import 'package:agrimisr/auth/controllers/login_controller.dart';
import 'package:agrimisr/auth/widgets/signup_text.dart';
import 'package:agrimisr/core/custom_validator.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:agrimisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final loginController = widget.loginController;
    //create 2 keys for the form
    final formKey = GlobalKey<FormState>();

    return Obx(
      () {
        return Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
      
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SignUpText(),
                    SizedBox(height: MySize.height * 0.02),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.emailAddress,
                      controller: loginController.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: MyValidators.instance
                          .getEmailOrPhoneValidator()
                          .build(),
                      prefixWidget: const Icon(Icons.email_outlined),
                      hintText: 'Auth.Login.Email'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      isObscureText: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.visiblePassword,
                      controller: loginController.passwordController,
                      validator:
                          MyValidators.instance.getPasswordValidator().build(),
                      prefixWidget: const Icon(Icons.lock_outline_rounded),
                      hintText: 'Auth.Login.Password'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    InkWell(
                      borderRadius: MyRadius.mCircularRadius,
                      onTap: () {
                        loginController.forgotPassword();
                      },
                      child: Padding(
                        padding: MyPadding.hPadding,
                        child: Text(
                          'Auth.Login.ForgotPassword'.tr(),
                          style: TextStyle(
                            fontSize: MySize.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Login.Login'.tr(),
                      controller: loginController,
                      onPressed: () => login(formKey, loginController),
                      isLoading: loginController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    InkWell(
                      borderRadius: MyRadius.mCircularRadius,
                      onTap: () {
                        print('Guest');
                      },
                      child: Padding(
                        padding: MyPadding.hPadding,
                        child: Text(
                          'Auth.Login.ContinueAsGuest'.tr(),
                          style: TextStyle(
                            fontSize: MySize.width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: MyColors.primaryDark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //on pressed function for login button
  void login(
    final formKey,
    final loginController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      loginController.login();
    }
  }
}
