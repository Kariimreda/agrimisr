//return a center with a text an image and a button

import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductsError extends StatefulWidget {
  const ProductsError({Key? key}) : super(key: key);

  @override
  State<ProductsError> createState() => _ProductsErrorState();
}

class _ProductsErrorState extends State<ProductsError>
    with SingleTickerProviderStateMixin {
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
                  child: Icon(
                    Icons.error_outline_rounded,
                    color: MyColors.primaryDark,
                    size: MyPadding.xxlPadding,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                'Cart.Error'.tr(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
