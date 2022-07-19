import 'package:agrimisr/auth/controllers/signup_controler.dart';
import 'package:agrimisr/core/custom_validator.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:agrimisr/widgets/ButtonControllers.dart';
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
    final registerFormKey = GlobalKey<FormState>();

    return ListView(
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
                controller: signupController.firstNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Auth.Signup.FirstName'.tr(),
                validator: MyValidators.instance.getNameValidator().build(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.01),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                controller: signupController.lastNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                hintText: 'Auth.Signup.LastName'.tr(),
                validator: MyValidators.instance.getNameValidator().build(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.01),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                controller: signupController.emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: MyValidators.instance.getEmailValidator().build(),
                hintText: 'Auth.Signup.Email'.tr(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.01),
              TextControllers().customTextFormField(
                context,
                padding: MyPadding.hPadding,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: signupController.phoneController,
                validator: MyValidators.instance.getPhoneValidator().build(),
                hintText: 'Auth.Signup.Phone'.tr(),
                contentPadding: const EdgeInsets.only(bottom: 5),
              ),
              SizedBox(height: MySize.height * 0.03),
              ButtonControllers().customRoundedLoaderButton(
                context,
                text: 'Auth.Signup.Next'.tr(),
                controller: signupController,
                onPressed: () => nextStep(registerFormKey, signupController),
              ),

              //  SizedBox(height: MySize.height * 0.05),
            ],
          ),
        ),
      ],
    );
  }

  //next button pressed
  void nextStep(
      GlobalKey<FormState> formKey, SignupController signupController) {
    if (formKey.currentState!.validate()) {
      signupController.setLoginState(LoginState.password);
    }
  }
}
