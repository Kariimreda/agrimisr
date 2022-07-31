import 'package:agrimisr/auth/screens/login_screen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

import 'package:easy_localization/easy_localization.dart';

enum LoginState {
  personalInfo,
  password,
}

class SignupController extends GetxController {
  final _loginState = LoginState.personalInfo.obs;

  LoginState get loginState => _loginState.value;

  void setLoginState(LoginState state) => _loginState.value = state;

  //controllers for the form fields
  //first and last names, email, phone, password, confirm password, pin
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pinController = TextEditingController();

  //getters for the form fields
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get pinController => _pinController;

  //signup methods and variables

  // Login methods and variables
  final isLoading = false.obs;
  final agreePolicyController = false.obs;

  Future<void> signUp() async {
    //if user didnt agree to the policy, show error
    if (!agreePolicyController.value) {
      Get.snackbar(
        'Auth.Signup.Error'.tr(),
        'Auth.Signup.AgreePolicy'.tr(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: MyColors.primaryDark,
        colorText: MyColors.white,
        borderRadius: MyPadding.mPadding,
        isDismissible: true,
        duration: const Duration(milliseconds: 1250),
        icon: const Icon(
          Icons.error_outline_rounded,
          color: Colors.white,
        ),
      );
      return;
    }
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('Signup Success');
    Get.offAllNamed(LoginScreen.routeName);
  }
}
