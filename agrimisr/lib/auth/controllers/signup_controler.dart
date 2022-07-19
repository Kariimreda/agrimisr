import 'package:agrimisr/core/custom_validator_locale.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:agrimisr/core/custom_validator.dart';

enum LoginState {
  personalInfo,
  password,
}

class SignupController extends GetxController {
  late final MyLocales localeController;
  late MyValidationLocale? validationLocale;
  late String? validationLocaleName;
  //initialize locale controller in constructor
  SignupController() {
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

  final _loginState = LoginState.personalInfo.obs;

  LoginState get loginState => _loginState.value;

  void setLoginState(LoginState state) => _loginState.value = state;

  //controllers for the form fields
  //first and last names, email, phone, password, confirm password, pin
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pinController = TextEditingController();

  //getters for the form fields
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get pinController => _pinController;

  //functions that return validators for the form fields
  ValidationBuilder getEmailValidator() {
    return ValidationBuilder(
      localeName: validationLocaleName,
      locale: validationLocale,
      optional: true,
    ).email();
  }

  ValidationBuilder getPasswordValidator() {
    //if locale is arabic, use custom locale, else set locale to null

    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .required()
        .password(validationLocale: validationLocale);
  }

  ValidationBuilder getPhoneValidator() {
    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .phone()
        .required();
  }

  //Name validator
  ValidationBuilder getNameValidator() {
    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .required();
  }

  //signup methods and variables

  // Login methods and variables
  final isLoading = false.obs;

  Future<void> signUp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('Signup Success');
  }
}
