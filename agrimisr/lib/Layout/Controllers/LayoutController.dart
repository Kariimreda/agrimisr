import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:agrimisr/Modules/Ui/homePage.dart';
import 'package:agrimisr/Modules/Ui/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [HomePage(), Cart(), Settings()];

  void ChangeBottomNav(int index) {
    currentIndex.value = index;
  }
}
