import 'package:agrimisr/account/controllers/account_controller.dart';
import 'package:agrimisr/account/widgets/edit_account_form.dart';
import 'package:agrimisr/account/widgets/edit_password_form.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/style/my_size.dart';
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
        child: SizedBox(
          height: MySize.height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MySize.height * 0.02),
              SizedBox(
                width: MySize.width * 0.6,
                height: MySize.height * 0.2,
                child: Image.asset(MyStrings.logoPath),
              ),
              arguments == AccountFormType.editInfo
                  ? EditAccountForm(accountController: accountController)
                  : arguments == AccountFormType.editPassword
                      ? EditPasswordForm(accountController: accountController)
                      : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
