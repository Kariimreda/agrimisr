import 'package:agrimisr/core/custom_validator_locale.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

extension CustomValidationBuilder on ValidationBuilder {
  password({String? message, MyValidationLocale? validationLocale}) =>
      add((value) {
        //if valid password return null
        //valid password should be 8-20 characters long and contain at least one number, one uppercase and one special charachter

        if (value == null) {
          return message ??
              validationLocale?.required() ??
              ValidationBuilder.globalLocale.required();
        }

        if (value.isNotEmpty &&
            value.length >= 8 &&
            value.length <= 20 &&
            value.contains(RegExp(r'[0-9]')) &&
            value.contains(RegExp(r'[A-Z]')) &&
            value.contains(
                RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"|,.<>\/?' "'" ']'))) {
          return null;
        }

        if (value.length < 8) {
          return message ??
              validationLocale?.minLength(value, 8) ??
              ValidationBuilder.globalLocale.minLength(value, 8);
        }
        if (value.length > 20) {
          return message ??
              validationLocale?.maxLength(value, 20) ??
              ValidationBuilder.globalLocale.maxLength(value, 20);
        }

        //if not valid return error message
        return message ??
            validationLocale?.password(value) ??
            'Password must contain at least\na number \nan uppercase letter \na special character like @#\$%';
      });
}

class MyValidators {
  MyValidators._privateConstructor() {
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
  static final MyValidators _instance = MyValidators._privateConstructor();
  static MyValidators get instance => _instance;

  late final MyLocales localeController;
  late MyValidationLocale? validationLocale;
  late String? validationLocaleName;

  //functions that return validators for the form fields
  ValidationBuilder getEmailOrPhoneValidator() {
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

  //functions that return validators for the form fields
  String? getQuantityValidators(String? value, int min, int max) {
    if (value == null) {
      return validationLocale?.required() ??
          ValidationBuilder.globalLocale.required();
    }

    //make sure value is a number integer  and between min and max
    if (int.tryParse(value) != null &&
        int.parse(value) >= min &&
        int.parse(value) <= max) {
      return null;
    }

    //if not int
    if (int.tryParse(value) == null) {
      return 'Cart.Validation.Quantity'.tr();
    }

    if (int.parse(value) < min) {
      return '${'Cart.Validation.QuantMustBeEqualOrGreaterThan'.tr()} $min';
    }

    if (int.parse(value) > max) {
      return '${'Cart.Validation.QuantMustBeEqualOrLessThan'.tr()} $max';
    }

    //if not a valid int return error message
    return 'Cart.Validation.Quantity'.tr();
  }

  ValidationBuilder getPasswordValidator() {
    //if locale is arabic, use custom locale, else set locale to null

    return ValidationBuilder(
            localeName: validationLocaleName, locale: validationLocale)
        .password(validationLocale: validationLocale);
  }

  //functions that return validators for the form fields
  ValidationBuilder getEmailValidator() {
    return ValidationBuilder(
      localeName: validationLocaleName,
      locale: validationLocale,
      optional: true,
    ).email();
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

  String? getConfirmPasswordValidator(String? value, final signupController) {
    if (value == null) {
      return '';
    }
    if (value.isEmpty) {
      return '';
    }
    if (value != signupController.passwordController.text) {
      return 'Auth.Signup.PasswordMismatch'.tr();
    }
    return null;
  }
}
