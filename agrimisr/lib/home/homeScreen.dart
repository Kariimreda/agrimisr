import 'package:agrimisr/home/homeController.dart';
import 'package:agrimisr/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.background,
      appBar: AppBar(
        backgroundColor: MyColors.primaryDark,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex,
        onTap: (index) {
          controller.ChangeBottomNav(index);
        },
        items: controller.bottomItems,
      ),
      body: controller.screens[controller.currentIndex],
    );
  }
}
