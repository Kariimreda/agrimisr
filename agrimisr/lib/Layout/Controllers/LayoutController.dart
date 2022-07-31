import 'package:agrimisr/InternetChecker/controller.dart';
import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:agrimisr/Modules/Ui/homePage.dart';
import 'package:agrimisr/Modules/Ui/settingsScreen.dart';
import 'package:agrimisr/category/models/category.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:internet_connection_checker/internet_connection_checker.dart';

class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  final categories = <Category>[].obs;
  final isLoading = false.obs;

  var hasInternet = false.obs;
  void checkForInternet() async {
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    if (!hasInternet.value) {
      Get.snackbar('No Internet connection', 'Try Again Later');
    }
  }

  void getCategories() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    categories.value = [
      Category(
        id: 1,
        title: 'أضافات الأعلاف',
        path: 'size',
      ),
      Category(
        id: 2,
        title: 'الأسمدة و المخصبات',
        path: 'color',
      ),
      Category(
        id: 3,
        title: 'مطهرات و كيماويات',
        path: 'type',
      ),
      Category(
        id: 4,
        title: 'المبيدات الزراعية',
        path: 'product',
      ),
      Category(
        id: 5,
        title: 'البذور و الشتلات',
        path: 'product',
      ),
      Category(
        id: 6,
        title: 'المعدات و الميكنة الزراعية',
        path: 'product',
      ),
      Category(
        id: 7,
        title: 'أعلاف جاهزه مصنعه',
        path: 'product',
      ),
      Category(
        id: 7,
        title: 'أدوية بيطريه',
        path: 'product',
      ),
    ];
    isLoading.value = false;
  }

  RxBool isSelected = false.obs;
  void IsSelected() {
    isSelected.value = !isSelected.value;
  }

  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined), label: 'Home.Home'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.shopping_cart_outlined),
        label: 'Home.Cart'.tr()),
    BottomNavigationBarItem(
        icon: const Icon(Icons.settings), label: 'Home.Settings'.tr()),
  ];

  List<Widget> screens = [const HomePage(), const Cart(), const Settings()];

  void changeBottomNav(int index) {
    currentIndex.value = index;
    InternetChecker().checkForInternet();
  }

  @override
  Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 8));
  }
}
