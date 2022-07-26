import 'package:agrimisr/product/models/product.dart';
import 'package:agrimisr/product/screens/product_screen.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigaTo();
  }

  void navigaTo() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAndToNamed(ProductScreen.routeName,
        arguments: Product(
          id: 1,
          imageUrl: 'https://picsum.photos/500',
          min: 4,
          price: 1023,
          quantity: 1000,
          rating: 4.5,
          seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
          title: 'مبيدات هيومازد ',
          weight: '500g',
          wishlisted: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.background,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/logo.png')),
          ],
        ),
      ),
    );
  }
}
