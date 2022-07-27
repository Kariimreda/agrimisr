import 'package:agrimisr/style/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

class ProductController extends GetxController {
  final quantityController = TextEditingController().obs;

  //getter for quantityController

  final isQuantChanged = false.obs;

  final isLoading = false.obs;

  void addToCart() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2), () {
      //show snackbar
      Get.snackbar(
        'Product.CartHasBeenUpdated'.tr(),
        'Product.ItemAddedToCart'.tr(),
        icon: const Icon(
          Icons.check_circle_outline_rounded,
          color: MyColors.primary,
        ),
        isDismissible: true,
        shouldIconPulse: true,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        backgroundColor: MyColors.white.withOpacity(0.4),
      );
      isLoading.value = false;
    });
  }
}
