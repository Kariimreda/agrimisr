import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://agrimisr.com/image/cache/catalog/new-ui/Banner_Gold_onion-860x527.jpg',
      'https://agrimisr.com/image/cache/Events_Banners/Group_92-860x527-860x527.jpg',
      'https://agrimisr.com/image/cache/Events_Banners/Shoura_Banner-860x527.jpg',
    ];
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              margin: EdgeInsets.all(MyPadding.m2Padding),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                    ],
                  )),
            ))
        .toList();
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: MyColors.primary,
          onRefresh: () async {
            await controller.refresh();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 3,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true,
                    initialPage: 2,
                    autoPlay: true,
                  ),
                  items: imageSliders,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/Cms-1.jpg',
                        fit: BoxFit.cover,
                        width: Get.width * 0.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/Cms-2.jpg',
                        fit: BoxFit.cover,
                        width: Get.width * 0.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/Cms-3.jpg',
                        fit: BoxFit.cover,
                        width: Get.width * 0.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/images/Cms-4.jpg',
                        fit: BoxFit.cover,
                        width: Get.width * 0.3,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding:
                      //const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      MyPadding.hvPadding,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.6,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: Get.height * 0.4,
                        child: Column(
                          children: [
                            Expanded(
                              child: (Image.asset(
                                'assets/images/0.20824100 1656946916-242x297.jpg',
                                fit: BoxFit.cover,
                              )),
                            ),
                            const Text(
                              'معلج ملوحة نانو سال- 5 لتر',
                              maxLines: 1,
                            ),
                            const Text('15ج'),
                            Row(
                              children: [
                                Image.asset('assets/images/add-cat.png'),
                                SizedBox(
                                  width: Get.width * 0.02,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.to(const Cart());
                                    },
                                    child: const Icon(Icons.add_shopping_cart),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
