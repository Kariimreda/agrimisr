import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/Modules/Ui/searchScreen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  static const String routeName = '/layout';
  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            drawer: MultiLevelDrawer(
              backgroundColor: Colors.white,
              rippleColor: Colors.white,
              subMenuBackgroundColor: Colors.grey.shade100,
              children: [
                MLMenuItem(
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.arrow_left),
                    content: const Text(
                      "My Profile",
                    ),
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 1")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 2")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 3")),
                    ],
                    onClick: () {
                      print('object');
                    }),
                MLMenuItem(
                    leading: const Icon(Icons.settings),
                    trailing: const Icon(Icons.arrow_right),
                    content: const Text("Settings"),
                    onClick: () {},
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 1")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 2"))
                    ]),
                MLMenuItem(
                  leading: const Icon(Icons.notifications),
                  content: const Text("Notifications"),
                  onClick: () {},
                ),
                MLMenuItem(
                    leading: const Icon(Icons.payment),
                    trailing: const Icon(Icons.arrow_right),
                    content: const Text(
                      "Payments",
                    ),
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 1")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 2")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 3")),
                      MLSubmenu(
                          onClick: () {},
                          submenuContent: const Text("Option 4")),
                    ],
                    onClick: () {}),
              ],
              header:
                  DrawerHeader(child: Image.asset('assets/images/logo.png')),
            ),
            backgroundColor: MyColors.background,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                    onPressed: () => Get.to(const Search()),
                    icon: const Icon(Icons.search)),
              ],
              // leading:
              //     IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex.value,
              onTap: (index) {
                controller.ChangeBottomNav(index);
              },
              items: controller.bottomItems,
            ),
            body: controller.screens[controller.currentIndex.value],
          ),
        ));
  }
}

// child: ListView(
// children: <Widget>[
// Divider(),
// InkWell(
// onTap: () {
// print('Clicked');
// Drawer(
// child: ListTile(
// title: Text('jvhvhgvghcg'),
// ),
// );
// },
// child: Container(
// padding: EdgeInsets.all(8),
// color: MyColors.background,
// child: Row(
// children: [
// Text('أقسام السوق الزراعي'),
// Spacer(),
// Icon(Icons.arrow_forward)
// ],
// ),
// ),
// ),
// Divider(),
// InkWell(
// onTap: () {
// print('Clicked');
// },
// child: Container(
// padding: EdgeInsets.all(8),
// color: MyColors.background,
// child: Row(
// children: [
// Text('شركات و خدمات'),
// Spacer(),
// Icon(Icons.arrow_forward)
// ],
// ),
// ),
// ),
// Divider(),
// InkWell(
// onTap: () {
// print('Clicked');
// },
// child: Container(
// padding: EdgeInsets.all(8),
// color: MyColors.background,
// child: Row(
// children: [
// Text('الجماعيات الاهليه'),
// ],
// ),
// ),
// ),
// Divider(),
// InkWell(
// onTap: () {
// print('Clicked');
// },
// child: Container(
// padding: EdgeInsets.all(8),
// color: MyColors.background,
// child: Row(
// children: [
// Text('خدمات الجماعيات الاهليه'),
// ],
// ),
// ),
// ),
// Divider(),
// InkWell(
// onTap: () {
// print('Clicked');
// },
// child: Container(
// padding: EdgeInsets.all(8),
// color: MyColors.background,s
// child: Row(
// children: [
// Text('الارشاد'),
// ],
// ),
// ),
// ),
// ],
// ),
