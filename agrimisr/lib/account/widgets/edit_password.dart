import 'package:agrimisr/account/controllers/account_controller.dart';
import 'package:agrimisr/core/custom_validator.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:agrimisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

class EditPassword extends StatefulWidget {
  const EditPassword({
    Key? key,
    required this.accountController,
  }) : super(key: key);

  final AccountController accountController;

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  @override
  Widget build(BuildContext context) {
    final accountController = widget.accountController;
    //create 2 keys for the form
    final formKey = GlobalKey<FormState>();

    return Obx(
      () {
        return Expanded(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: accountController.firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Auth.Signup.FirstName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.05),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: accountController.lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Auth.Signup.LastName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.05),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.emailAddress,
                      controller: accountController.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getEmailValidator().build(),
                      hintText: 'Auth.Signup.Email'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.05),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.phone,
                      controller: accountController.phoneNumberController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getPhoneValidator().build(),
                      hintText: 'Auth.Signup.Phone'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.05),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Signup.Next'.tr(),
                      controller: accountController,
                      onPressed: () => editInfo(formKey, accountController),
                      isLoading: accountController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.01),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  //on pressed function for login button
  void editInfo(
    final formKey,
    final AccountController accountController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      accountController.editAccountInfo();
    }
  }
}
