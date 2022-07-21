import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:agrimisr/Modules/Ui/homePage.dart';
import 'package:agrimisr/Modules/Ui/settingsScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: 'Home.Home'.tr()),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Home.Cart'.tr()),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Home.Settings'.tr()),
  ];

  List<Widget> screens = [const HomePage(), const Cart(), const Settings()];

  void ChangeBottomNav(int index) {
    currentIndex.value = index;
  }

  Future<void> refresh() {
    return Future.delayed(Duration(seconds: 8));
  }
}
