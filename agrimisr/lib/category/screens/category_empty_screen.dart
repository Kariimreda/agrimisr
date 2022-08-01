//return a center with a text an image and a button

import 'package:agrimisr/Layout/Controllers/LayoutController.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

/// a widget that notifies the user that this category has no items
class EmptyCategory extends StatefulWidget {
  const EmptyCategory({Key? key}) : super(key: key);

  @override
  State<EmptyCategory> createState() => _EmptyCategoryState();
}

class _EmptyCategoryState extends State<EmptyCategory>
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
                    child: Icon(
                      Icons.local_florist_rounded,
                      size: MySize.height * 0.15,
                      color: MyColors.primary,
                    )),
              ),
            ),
            Text(
              'Category.Empty'.tr(),
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
