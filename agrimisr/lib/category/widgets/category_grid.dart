import 'package:agrimisr/category/controllers/category_controller.dart';
import 'package:agrimisr/category/widgets/category_tile.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({Key? key}) : super(key: key);

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MyPadding.hvPadding,
      child: Center(
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: categoryController.products.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryTile(index: index);
            }),
      ),
    );
  }
}
