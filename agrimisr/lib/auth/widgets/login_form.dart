import 'package:agrimisr/auth/widgets/signup_text.dart';
import 'package:agrimisr/style/style.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:form_validator/form_validator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SignUpText(),
        SizedBox(height: height * 0.01),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MyPadding.hPadding,
          ),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailController,
            validator: ValidationBuilder().email().maxLength(50).build(),
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'Auth.Login.Email'.tr(),
              hintStyle: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
                color: MyColors.grey,
              ),
            ),
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
              color: MyColors.primaryDark,
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MyPadding.hPadding,
          ),
          child: TextFormField(
            keyboardType: TextInputType.visiblePassword,
            controller: passwordController,
            validator: (value) {
              //validate that it is a valid password
              return null;
            },
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              hintText: 'Auth.Login.Password'.tr(),
              hintStyle: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
                color: MyColors.grey,
              ),
            ),
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w500,
              color: MyColors.primaryDark,
            ),
          ),
        ),
        SizedBox(height: height * 0.03),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MyPadding.hPadding,
          ),
          child: SizedBox(
            width: double.infinity,
            height: height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {},
              child: Text(
                'Auth.Login.Login'.tr(),
                style: TextStyle(
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.bold,
                  color: MyColors.white,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.01),
        Text(
          'Auth.Login.ContinueAsGuest'.tr(),
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.bold,
            color: MyColors.primaryDark,
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    ));
  }
}
