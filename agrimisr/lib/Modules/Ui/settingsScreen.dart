import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void openLink(final Url) async {
    if (!await launchUrl(
      Url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch ${Url}';
    }
  }

  @override
  Widget build(BuildContext context) {
    RxBool toggled = RxBool(
        EasyLocalization.of(context)!.locale.languageCode == 'ar'
            ? false
            : true);
    return Obx(() => SingleChildScrollView(
          child: Column(
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
              SizedBox(
                height: 10,
              ),
              ExpansionTile(
                title: Text('Settings.Information'.tr()),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              openLink(MyStrings.AboutUs);
                            },
                            child: Text('Settings.About'.tr())),
                        Divider(),
                        InkWell(
                            onTap: () {
                              openLink(MyStrings.privacyPolicyUri);
                            },
                            child: Text('Settings.Privacy'.tr())),
                        Divider(),
                        InkWell(
                            onTap: () {
                              openLink(MyStrings.AboutUs);
                            },
                            child: Text('Settings.Conditions'.tr())),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Settings.Additions'.tr()),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              openLink(MyStrings.Companies);
                            },
                            child: Text('Settings.corporation'.tr())),
                        Divider(),
                        InkWell(
                            onTap: () {
                              openLink(MyStrings.Map);
                            },
                            child: Text('Settings.Location'.tr()))
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Settings.My account'.tr()),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Settings.My account'.tr()),
                        Divider(),
                        InkWell(
                            onTap: () {
                              Get.to(Cart());
                            },
                            child: Text('Settings.Orders'.tr())),
                      ],
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text('Settings.Contact us'.tr()),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Settings.Loc'.tr()),
                        Divider(),
                        InkWell(
                            onTap: () {
                              launchUrl(MyStrings.phone);
                            },
                            child: Text('15255')),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
