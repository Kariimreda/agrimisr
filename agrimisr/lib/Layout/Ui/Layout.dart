import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/Modules/Ui/searchScreen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

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
                    leading: Icon(Icons.person),
                    trailing: Icon(Icons.arrow_left),
                    content: Text(
                      "My Profile",
                    ),
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 1")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 2")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 3")),
                    ],
                    onClick: () {
                      print('object');
                    }),
                MLMenuItem(
                    leading: Icon(Icons.settings),
                    trailing: Icon(Icons.arrow_right),
                    content: Text("Settings"),
                    onClick: () {},
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 1")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 2"))
                    ]),
                MLMenuItem(
                  leading: Icon(Icons.notifications),
                  content: Text("Notifications"),
                  onClick: () {},
                ),
                MLMenuItem(
                    leading: Icon(Icons.payment),
                    trailing: Icon(Icons.arrow_right),
                    content: Text(
                      "Payments",
                    ),
                    subMenuItems: [
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 1")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 2")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 3")),
                      MLSubmenu(
                          onClick: () {}, submenuContent: Text("Option 4")),
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
                    onPressed: () => Get.to(Search()),
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
