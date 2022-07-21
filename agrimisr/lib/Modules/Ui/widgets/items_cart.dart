import 'package:agrimisr/Modules/Controllers/cart_controller.dart';
import 'package:agrimisr/Modules/Ui/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatefulWidget {
  const CartItems({Key? key, required this.cartController}) : super(key: key);
  final CartController cartController;
  @override
  State<CartItems> createState() => _CartItemsState();
}

class _CartItemsState extends State<CartItems> {
  //cart controller
  @override
  Widget build(BuildContext context) {
    final cartController = widget.cartController;
    //layout get controller

    return Obx(
      () => ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return CartTile(index: index, cartController: cartController);
        },
        itemCount: cartController.cartItems.length,
      ),
    );
  }
}
