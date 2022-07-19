import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
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
    final formKeyPassword = GlobalKey<FormFieldState>();
    final formKeyConfirmPassword = GlobalKey<FormFieldState>();

    return Obx(
      () => ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              SizedBox(height: MySize.height * 0.02),
              TextControllers().customTextFormField(
                context,
                formKey: formKeyPassword,
                padding: MyPadding.hPadding,
                controller: signupController.passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Auth.Signup.Password'.tr(),
                isObscureText: true,
                validator: signupController.getPasswordValidator().build(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.01),
              TextControllers().customTextFormField(
                context,
                formKey: formKeyConfirmPassword,
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
              Padding(
                padding: MyPadding.hPadding,
                child: SizedBox(
                  width: double.infinity,
                  height: MySize.height * 0.06,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      //validate all forms using thier keys
                      if (formKeyPassword.currentState!.validate() &&
                          formKeyConfirmPassword.currentState!.validate()) {
                        signupController.signUp();
                      }
                    },
                    child: signupController.isLoading.value
                        ? const CircularProgressIndicator(
                            color: MyColors.white,
                          )
                        : Text(
                            'Auth.Signup.Signup'.tr(),
                            style: TextStyle(
                              fontSize: MySize.width * 0.05,
                              fontWeight: FontWeight.bold,
                              color: MyColors.white,
                            ),
                          ),
                  ),
                ),
              ),
              SizedBox(height: MySize.height * 0.05),
            ],
          ),
        ],
      ),
    );
  }
}
