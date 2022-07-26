import 'package:agrimisr/account/controllers/account_controller.dart';
import 'package:agrimisr/account/screens/adresses_screen.dart';
import 'package:agrimisr/account/widgets/edit_account_form.dart';
import 'package:agrimisr/account/widgets/edit_password_form.dart';
import 'package:agrimisr/core/app_http_client/api_client.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({Key? key}) : super(key: key);

  static const String routeName = '/edit_info';

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  final accountController = Get.put(AccountController());
  //arguments from the previous screen
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MySize.height * 0.02),
                SizedBox(
                  width: MySize.width * 0.6,
                  height: MySize.height * 0.2,
                  child: Image.asset(MyStrings.logoPath),
                ),
                SizedBox(height: MySize.height * 0.05),
                arguments == AccountFormType.editInfo
                    ? EditAccountForm(accountController: accountController)
                    : arguments == AccountFormType.editPassword
                        ? EditPasswordForm(accountController: accountController)
                        : arguments == AccountFormType.editAdress
                            ? const AdressesScreen()
                            : Container(
                                child: Center(
                                  child: ButtonControllers()
                                      .customRoundedLoaderButton(
                                    context,
                                    text: "Press ME",
                                    onPressed: () async {
                                      // await dioClient.request(
                                      //     HttpMethod.get, 'google.com');

                                      try {
                                        final response =
                                            await Api().dio.get('/sdkdjf');
                                        print(response);
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                  ),
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
