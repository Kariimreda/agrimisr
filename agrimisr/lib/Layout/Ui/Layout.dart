import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/Modules/Ui/searchScreen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);
  static const String routeName = '/layout';

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final controller = Get.put(HomeController());
  var darwertext = ButtonControllers().drawerTextButton;

  @override
  // void initState() {
  //   super.initState();
  //   initialization();
  // }
  //
  // void initialization() async {
  //   // This is where you can initialize the resources needed by your app while
  //   // the splash screen is displayed.  Remove the following example because
  //   // delaying the user experience is a bad design practice!
  //   // ignore_for_file: avoid_print
  //   print('ready in 3...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 2...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('ready in 1...');
  //   await Future.delayed(const Duration(seconds: 1));
  //   print('go!');
  //   // FlutterNativeSplash.remove();
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            drawer: Drawer(
              backgroundColor: MyColors.primaryDark,
              child: ListView(
                children: [
                  DrawerHeader(child: Image.asset('assets/images/logo.png')),
                  Divider(
                    color: MyColors.background,
                  ),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: Text('أقسام السوق الزراعي'),
                      collapsedBackgroundColor: MyColors.background,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text('أضافات الأعلاف'),
                              Divider(
                                color: MyColors.background,
                              ),
                              ExpansionTile(
                                title: Text('الأسمدة و المخصبات'),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          Text('الأسمدة البوتاسية (90)'),
                                          Divider(
                                            color: MyColors.background,
                                          ),
                                          Text('الأسمدة الفوسفاتية (57)')
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: Text('شركات و خدمات'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(' تسجيل بائعين'),
                                Divider(
                                  color: MyColors.background,
                                ),
                                Text("تسجيل مقدمى الخدمات")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  darwertext(context, text: 'الجماعيات الاهليه'),
                  Divider(),
                  darwertext(context, text: 'خدمات الجماعيات الاهليه'),
                  Divider(),
                  darwertext(context, text: 'الارشاد')
                ],
              ),
            ),
            backgroundColor: Colors.white,
            appBar: controller.currentIndex == 1
                ? null
                : AppBar(
                    foregroundColor: MyColors.primaryDark,
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                          onPressed: () => Get.to(Search()),
                          icon: const Icon(
                            Icons.search,
                            color: MyColors.primaryDark,
                          )),
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
