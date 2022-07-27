import 'package:agrimisr/Modules/Controllers/productsControlller.dart';
import 'package:agrimisr/Modules/Ui/cartScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

import '../../../Controllers/productsControlller.dart';

class ProductTile extends StatefulWidget {
  ProductTile({Key? key, required this.index, required this.productsController})
      : super(key: key);
  final int index;
  final ProductsController productsController;

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    final ProductsController = widget.productsController;
    final index = widget.index;
    return SizedBox(
      height: Get.height * 0.4,
      child: Column(
        children: [
          Expanded(
            child: (Image.asset(
              ProductsController.ProductsItem[index].imageUrl,
              fit: BoxFit.cover,
            )),
          ),
          Text(
            ProductsController.ProductsItem[index].title,
            maxLines: 1,
          ),
          Text(ProductsController.ProductsItem[index].price.toString()),
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
  }
}
