import 'package:agrimisr/core/locales.dart';
import 'package:agrimisr/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    RxBool toggled = RxBool(
        EasyLocalization.of(context)!.locale.languageCode == 'ar'
            ? false
            : true);
    return Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text('Settings.English'.tr()),
              subtitle: Text('Settings.Choose your preferred language'.tr()),
              value: toggled.value,
              onChanged: (bool value) {
                toggled.value = value;
                EasyLocalization.of(context)!
                    .setLocale(MyLocales.supportedLocales[value ? 1 : 0]);
                Get.updateLocale(MyLocales.supportedLocales[value ? 1 : 0]);
                RestartWidget.restartApp(context);
              },
              secondary: Image.asset('assets/images/add-cat.png'),
            ),
          ],
        ));
  }
}
