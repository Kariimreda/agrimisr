//class and list of supported locales for the application

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

///Defualt locale is index 0
///
///Use [SupportedLocales] of [0] for defualt locale, or [1] for second locale ...
///
/// Get the number of locales by using [supportedLocales.length]
///
/// Get Current locale by using [currentLocale]
class MyLocales extends GetxController {
  //current Locale

  //list of supported locales
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('ar', 'EG'),
  ];

  //list of supported locales names
  static const supportedLocalesNames = [
    'العربية',
    'English',
  ];

  //list of supported locales codes
  static const supportedLocalesCodes = [
    'ar',
    'en',
  ];

  //TODO: set it on the app start up with the data from shared preferences
  final currentLocale = supportedLocales[0].obs;

  ///set device locale, takes [context] and [index] of supported locales as parameters
  ///
  ///[index] is the index of supported locales in [supportedLocales]
  ///
  ///[context] is the context of the widget
  ///

  void setDeviceLocale(BuildContext context, int index) {
    //make sure the index is in range
    if (index < 0 || index >= supportedLocales.length) {
      return;
    }
    EasyLocalization.of(context)!.setLocale(supportedLocales[index]).then(
          (value) => currentLocale.value = supportedLocales[index],
        );
  }
}
