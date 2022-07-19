import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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

  Future<void> signUp() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('Signup Success');
  }
}
