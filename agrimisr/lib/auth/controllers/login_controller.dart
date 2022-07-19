import 'package:agrimisr/style/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  @override
  void onReady() {
    SizeConfig().init(Get.context!);
    super.onReady();
  }

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
  }
}
