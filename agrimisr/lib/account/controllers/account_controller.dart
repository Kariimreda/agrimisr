import 'package:agrimisr/account/models/account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

enum AccountFormType {
  editInfo,
  editPassword,
  editAdress,
  editWishlist,
}

class AccountController extends GetxController {
  final account = <Account>[].obs;

  final isLoading = false.obs;

  //text editing controllers for
  //first name
  final firstNameTextEditingController = TextEditingController();
  //last name
  final lastNameTextEditingController = TextEditingController();
  //email
  final emailTextEditingController = TextEditingController();
  //password
  final passwordTextEditingController = TextEditingController();
  //confirm password
  final confirmTextEditingPasswordController = TextEditingController();
  //phone number
  final phoneNumberTextEditingController = TextEditingController();

  //getters for the text editing controllers
  TextEditingController get firstNameController =>
      firstNameTextEditingController;
  TextEditingController get lastNameController => lastNameTextEditingController;
  TextEditingController get emailController => emailTextEditingController;
  TextEditingController get passwordController => passwordTextEditingController;
  TextEditingController get confirmPasswordController =>
      confirmTextEditingPasswordController;
  TextEditingController get phoneNumberController =>
      phoneNumberTextEditingController;

  @override
  void onInit() {
    super.onInit();
    getAccount();
  }

  void getAccount() async {
    isLoading.value = true;
    //return a dummy account for testing
    await Future.delayed(const Duration(seconds: 2));
    account.add(
      Account(
          id: 1, firstName: 'youssef', lastName: 'zaka', phone: '01064504003'),
    );
    isLoading.value = false;
  }

  Future<void> editAccountInfo() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    print('code sent');
    Get.back();
    //show a default get dialouge with a success message
    Get.defaultDialog(
      title: 'Auth.Login.Success'.tr(),
      middleText: '',
      middleTextStyle: const TextStyle(fontSize: 0),
      actions: [
        ElevatedButton(
          child: const Text('OK'),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
