import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/auth/widgets/signup_text.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:agrimisr/widgets/TextControllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      reverse: true,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SignUpText(),
            SizedBox(height: MySize.height * 0.02),
            TextControllers().customTextFormField(
              context,
              padding: MyPadding.hPadding,
              keyboardType: TextInputType.emailAddress,
              controller: signupController.emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: signupController.getEmailValidator().build(),
              prefixWidget: const Icon(Icons.email_outlined),
              hintText: 'Auth.Login.Email'.tr(),
              contentPadding: const EdgeInsets.only(bottom: 5),
            ),
            SizedBox(height: MySize.height * 0.01),
            TextControllers().customTextFormField(
              context,
              padding: MyPadding.hPadding,
              isObscureText: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.visiblePassword,
              controller: signupController.passwordController,
              validator: signupController.getPasswordValidator().build(),
              prefixWidget: const Icon(Icons.lock_outline_rounded),
              hintText: 'Auth.Login.Password'.tr(),
              contentPadding: const EdgeInsets.only(bottom: 5),
            ),
            InkWell(
              borderRadius: MyRadius.mCircularRadius,
              onTap: () {
                print('Forgot Password');
              },
              child: Padding(
                padding: MyPadding.hPadding,
                child: Text(
                  'Auth.Login.ForgotPassword'.tr(),
                  style: TextStyle(
                    fontSize: MySize.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryDark,
                  ),
                ),
              ),
            ),
            SizedBox(height: MySize.height * 0.01),
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
                    //validate all
                    if (signupController
                                .getEmailValidator()
                                .test(signupController.emailController.text) ==
                            null &&
                        signupController.getPasswordValidator().test(
                                signupController.passwordController.text) ==
                            null) {
                      print('valid');
                    }
                  },
                  child: Text(
                    'Auth.Login.Login'.tr(),
                    style: TextStyle(
                      fontSize: MySize.width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: MyColors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MySize.height * 0.01),
            InkWell(
              borderRadius: MyRadius.mCircularRadius,
              onTap: () {
                print('Guest');
              },
              child: Padding(
                padding: MyPadding.hPadding,
                child: Text(
                  'Auth.Login.ContinueAsGuest'.tr(),
                  style: TextStyle(
                    fontSize: MySize.width * 0.04,
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryDark,
                  ),
                ),
              ),
            ),
            SizedBox(height: MySize.height * 0.02),
          ],
        ),
      ],
    );
  }
}
