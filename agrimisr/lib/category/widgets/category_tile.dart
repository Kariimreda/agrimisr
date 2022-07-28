import 'package:agrimisr/category/controllers/category_controller.dart';
import 'package:agrimisr/product/screens/product_screen.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'dart:ui' as ui;

class CategoryTile extends StatefulWidget {
  const CategoryTile({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    final index = widget.index;

    return SizedBox(
      height: Get.height * 0.4,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: InkWell(
              onTap: () => {
                Get.toNamed(
                  ProductScreen.routeName,
                  arguments: categoryController.products[index],
                ),
              },
              child: Center(
                child: ClipRect(
                  clipBehavior: Clip.hardEdge,
                  child: Hero(
                    tag: categoryController.products[index].id,
                    child: (Image.network(
                      categoryController.products[index].imageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
              ),
            ),
          ),
          Text(
            categoryController.products[index].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: MySize.height * 0.022,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.ideographic,
            ),
          ),
          Text(
            '${categoryController.products[index].price} ${'Cart.Currency'.tr()}',
            style: TextStyle(fontSize: MySize.width * 0.035),
          ),
          Row(
            textDirection: ui.TextDirection.rtl,
            children: [
              Image.asset('assets/images/add-cat.png'),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.snackbar('Added to cart', 'Check your Cart',
                        snackPosition: SnackPosition.BOTTOM);
                  },
                  child: const Icon(Icons.add_shopping_cart),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
