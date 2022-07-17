import 'package:agrimisr/home/homeScreen.dart';
import 'package:agrimisr/home/searchScreen.dart';
import 'package:agrimisr/home/settingsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.settings), label: 'Settings'),
  ];

  List<Widget> screens = [HomePage(), Search(), Settings()];

  void ChangeBottomNav(int index) {
    currentIndex = index;
  }
}
