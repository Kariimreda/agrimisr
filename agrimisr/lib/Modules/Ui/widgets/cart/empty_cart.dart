//return a center with a text an image and a button

import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

/// A widget that notifies the user that his cart is empty
class EmptyCart extends StatefulWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  State<EmptyCart> createState() => _EmptyCartState();
}

class _EmptyCartState extends State<EmptyCart>
    with SingleTickerProviderStateMixin {
  /// animation used to show an empty cart goin up and down
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.05),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.elasticIn,
  ));
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //layout get controller
    final homeController = Get.put(HomeController());

    return Center(
      child: SizedBox(
        width: MySize.width,
        height: MySize.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SlideTransition(
                position: offsetAnimation,
                child: Padding(
                  padding: MyPadding.svPadding,
                  child: Image.asset(
                    MyStrings.greenCartPath,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              'Cart.Empty'.tr(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            ButtonControllers().customRoundedLoaderButton(context,
                text: 'Cart.ShopNow'.tr(),
                onPressed: () => homeController.changeBottomNav(0)),
          ],
        ),
      ),
    );
  }
}
