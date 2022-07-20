import 'package:agrimisr/Layout/Ui/Layout.dart';
import 'package:agrimisr/auth/screens/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

class LoginController extends GetxController {
  //controllers for the form fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  //getters for the form fields
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  // Login methods and variables
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('Login Success');
    Get.offAndToNamed(Layout.routeName);
  }

  //forgot password method opens forgot password screen
  void forgotPassword() {
    Get.toNamed(ForgotPasswordScreen.routeName);
  }

  Future<void> resetPassword() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('code sent');
    Get.back();
    //show a default get dialouge with a success message
    Get.defaultDialog(
      title: 'Auth.Login.Success'.tr(),
      middleText: 'Auth.Login.CheckEmail'.tr(),
      middleTextStyle: const TextStyle(fontSize: 16),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
