import 'package:agrimisr/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:easy_localization/easy_localization.dart';

class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Auth.Login.SignUp1".tr(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: MyColors.grey,
          ),
        ),
        Text(
          "Auth.Login.SignUp2".tr(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: MyColors.primary,
          ),
        ),
      ],
    );
  }
}
