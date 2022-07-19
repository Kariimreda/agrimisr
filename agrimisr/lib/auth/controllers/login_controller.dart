import 'package:agrimisr/core/custom_validator_locale.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:agrimisr/core/custom_validator.dart';

class LoginController extends GetxController {
  late final MyLocales localeController;
  late MyValidationLocale? validationLocale;
  late String? validationLocaleName;
  //initialize locale controller in constructor
  LoginController() {
    localeController = Get.put(MyLocales());
    //if locale is arabic, use custom locale, else set locale to null
    validationLocale = localeController.currentLocale.value.languageCode == 'ar'
        ? MyValidationLocale()
        : null;
    //if locale is arabic, set locale name to null, else set localename to language code of current locale
    validationLocaleName =
        localeController.currentLocale.value.languageCode != 'ar'
            ? localeController.currentLocale.value.languageCode
            : null;
  }

  //controllers for the form fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //getters for the form fields
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  //functions that return validators for the form fields
  ValidationBuilder getEmailValidator() {
    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .or(
      (builder) => builder.email(),
      (builder) => builder.phone(
        localeController.currentLocale.value.languageCode != 'ar'
            ? 'Phone or Email not correct'
            : validationLocale!.phoneEmail(''),
      ),
    );
  }

  ValidationBuilder getPasswordValidator() {
    //if locale is arabic, use custom locale, else set locale to null

    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .password(validationLocale: validationLocale);
  }

  // Login methods and variables
  final loading = false.obs;

  Future<void> login() async {
    loading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    loading.value = false;
    print('Login Success');
  }
}
