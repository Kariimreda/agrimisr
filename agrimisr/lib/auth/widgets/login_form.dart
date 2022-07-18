import 'package:agrimisr/auth/widgets/signup_text.dart';
import 'package:agrimisr/core/custom_validator_locale.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:agrimisr/widgets/TextControllers.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;
import 'package:agrimisr/core/custom_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.localeController,
  }) : super(key: key);

  final MyLocales localeController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(
      () {
        //if locale is arabic, use custom locale, else set locale to null
        var validationLocale =
            widget.localeController.currentLocale.value.languageCode == 'ar'
                ? MyValidationLocale()
                : null;
        //if locale is arabic, set locale name to null, else set localename to language code of current locale
        var validationLocaleName =
            widget.localeController.currentLocale.value.languageCode != 'ar'
                ? widget.localeController.currentLocale.value.languageCode
                : null;

        final emailValidator = ValidationBuilder(
                localeName: validationLocaleName, locale: validationLocale)
            .or(
          (builder) => builder.email(),
          (builder) => builder.phone(
              widget.localeController.currentLocale.value.languageCode != 'ar'
                  ? 'Phone or Email not correct'
                  : null),
        );

        final passwordValidator = ValidationBuilder(
                localeName: validationLocaleName, locale: validationLocale)
            .password(validationLocale: validationLocale);

        return Expanded(
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),
            reverse: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SignUpText(),
                  SizedBox(height: MySize.height * 0.02),
                  TextControllers().customTextFormField(
                    context,
                    padding: MyPadding.hPadding,
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: emailValidator.build(),
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
                    controller: passwordController,
                    validator: passwordValidator.build(),
                    prefixWidget: const Icon(Icons.lock_outline_rounded),
                    hintText: 'Auth.Login.Password'.tr(),
                    contentPadding: const EdgeInsets.only(bottom: 5),
                  ),
                  SizedBox(height: MySize.height * 0.03),
                  Padding(
                    padding: MyPadding.hPadding,
                    child: SizedBox(
                      width: double.infinity,
                      height: MySize.height * 0.06,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          //validate all
                          if (emailValidator.test(emailController.text) ==
                                  null &&
                              passwordValidator.test(passwordController.text) ==
                                  null) {
                            print('valid');
                          }
                        },
                        child: Text(
                          'Auth.Login.Login'.tr(),
                          style: TextStyle(
                            fontSize: MySize.width * 0.05,
                            fontWeight: FontWeight.bold,
                            color: MyColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  Text(
                    'Auth.Login.ContinueAsGuest'.tr(),
                    style: TextStyle(
                      fontSize: MySize.width * 0.04,
                      fontWeight: FontWeight.bold,
                      color: MyColors.primaryDark,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.02),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
