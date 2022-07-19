import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:agrimisr/widgets/TextControllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({
    Key? key,
    required this.signupController,
  }) : super(key: key);

  final SignupController signupController;

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final signupController = widget.signupController;

    //create 3 form keys, one for each form field except email as it is optional
    final formKeyFirstName = GlobalKey<FormFieldState>();
    final formKeyLastName = GlobalKey<FormFieldState>();
    final formKeyPhone = GlobalKey<FormFieldState>();

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            SizedBox(height: MySize.height * 0.02),
            TextControllers().customTextFormField(
              context,
              formKey: formKeyFirstName,
              padding: MyPadding.hPadding,
              controller: signupController.firstNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: 'Auth.Signup.FirstName'.tr(),
              validator: signupController.getNameValidator().build(),
              contentPadding: const EdgeInsets.only(bottom: 5),
            ),
            SizedBox(height: MySize.height * 0.01),
            TextControllers().customTextFormField(
              context,
              formKey: formKeyLastName,
              padding: MyPadding.hPadding,
              controller: signupController.lastNameController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              hintText: 'Auth.Signup.LastName'.tr(),
              validator: signupController.getNameValidator().build(),
              contentPadding: const EdgeInsets.only(bottom: 5),
            ),
            SizedBox(height: MySize.height * 0.01),
            TextControllers().customTextFormField(
              context,
              padding: MyPadding.hPadding,
              controller: signupController.emailController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: signupController.getEmailValidator().build(),
              hintText: 'Auth.Signup.Email'.tr(),
              contentPadding: const EdgeInsets.only(bottom: 5),
            ),
            SizedBox(height: MySize.height * 0.01),
            TextControllers().customTextFormField(
              context,
              formKey: formKeyPhone,
              padding: MyPadding.hPadding,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: signupController.phoneController,
              validator: signupController.getPhoneValidator().build(),
              hintText: 'Auth.Signup.Phone'.tr(),
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
                    if (formKeyFirstName.currentState!.validate() &&
                        formKeyLastName.currentState!.validate() &&
                        formKeyPhone.currentState!.validate()) {
                      signupController.setLoginState(LoginState.password);
                    }
                  },
                  child: Text(
                    'Auth.Signup.Next'.tr(),
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
    );
  }
}
