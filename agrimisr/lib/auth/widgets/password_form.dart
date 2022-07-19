import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/core/custom_validator.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:agrimisr/widgets/ButtonControllers.dart';
import 'package:agrimisr/widgets/TextControllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

class PasswordForm extends StatefulWidget {
  const PasswordForm({
    Key? key,
    required this.signupController,
  }) : super(key: key);

  final SignupController signupController;

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final signupController = widget.signupController;

    //create 3 form keys, one for each form field except pin as it is optional
    final registerFormKey = GlobalKey<FormState>();

    return Obx(
      () => ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Form(
            key: registerFormKey,
            child: Column(
              children: [
                SizedBox(height: MySize.height * 0.02),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: 'Auth.Signup.Password'.tr(),
                  isObscureText: true,
                  validator:
                      MyValidators.instance.getPasswordValidator().build(),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.01),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.confirmPasswordController,
                  hintText: 'Auth.Signup.ConfirmPassword'.tr(),
                  isObscureText: true,
                  validator: ((value) {
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
                  }),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.01),
                TextControllers().customTextFormField(
                  context,
                  padding: MyPadding.hPadding,
                  controller: signupController.pinController,
                  hintText: 'Auth.Signup.Pin'.tr(),
                  contentPadding: const EdgeInsets.only(bottom: 5),
                ),
                SizedBox(height: MySize.height * 0.03),
                ButtonControllers().customRoundedLoaderButton(
                  context,
                  text: 'Auth.Signup.Signup'.tr(),
                  controller: signupController,
                  onPressed: () => signUp(registerFormKey, signupController),
                  isLoading: signupController.isLoading,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signUp(
      GlobalKey<FormState> registerFormKey, SignupController signupController) {
    if (registerFormKey.currentState!.validate()) {
      signupController.signUp();
    }
  }
}
