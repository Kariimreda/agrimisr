import 'package:agrimisr/InternetChecker/controller.dart';
import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/Modules/Ui/searchScreen.dart';
import 'package:agrimisr/category/models/category.dart';
import 'package:agrimisr/category/screens/category_screen.dart';
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
  final internetController = Get.put(InternetChecker());
  var darwertext = ButtonControllers().drawerTextButton;

  @override
  void initState() {
    controller.getCategories();
    internetController.checkForInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            drawer: Drawer(
              backgroundColor: MyColors.background,
              child: ListView(
                children: [
                  DrawerHeader(child: Image.asset('assets/images/logo.png')),
                  Divider(
                    color: MyColors.background,
                  ),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: const Text('أقسام السوق الزراعي'),
                      collapsedBackgroundColor: MyColors.background,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              InkWell(
                                  onTap: (() => Get.toNamed(
                                        CategoryScreen.routeName,
                                        arguments: Category(
                                            id: 1,
                                            title: 'title',
                                            path: 'path'),
                                      )),
                                  child: const Text('أضافات الأعلاف')),
                              Divider(
                                color: MyColors.background,
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(CategoryScreen.routeName,
                                            arguments:
                                                controller.categories[index]);
                                      },
                                      child: Text(
                                          controller.categories[index].title),
                                    ),
                                  );
                                },
                                itemCount: controller.categories.length,
                              ),
                              Divider(
                                color: MyColors.background,
                              ),
                              ExpansionTile(
                                title: const Text('الأسمدة و المخصبات'),
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
                                          const Text('الأسمدة البوتاسية (90)'),
                                          Divider(
                                            color: MyColors.background,
                                          ),
                                          const Text('الأسمدة الفوسفاتية (57)')
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
                  const Divider(),
                  Container(
                    color: MyColors.background,
                    child: ExpansionTile(
                      title: const Text('شركات و خدمات'),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            onTap: () {},
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text(' تسجيل بائعين'),
                                Divider(
                                  color: MyColors.background,
                                ),
                                const Text("تسجيل مقدمى الخدمات")
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  darwertext(context, text: 'الجماعيات الاهليه'),
                  const Divider(),
                  darwertext(context, text: 'خدمات الجماعيات الاهليه'),
                  const Divider(),
                  darwertext(context, text: 'الارشاد')
                ],
              ),
            ),
            backgroundColor: Colors.white,
            appBar: controller.currentIndex.value == 1
                ? null
                : AppBar(
                    foregroundColor: MyColors.primaryDark,
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                          onPressed: () => Get.to(const Search()),
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
                controller.changeBottomNav(index);
              },
              items: controller.bottomItems,
            ),
            body: controller.screens[controller.currentIndex.value],
          ),
        ));
  }
}
