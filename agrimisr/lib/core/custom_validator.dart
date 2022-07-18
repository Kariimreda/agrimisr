import 'package:agrimisr/core/custom_validator_locale.dart';
import 'package:form_validator/form_validator.dart';

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
