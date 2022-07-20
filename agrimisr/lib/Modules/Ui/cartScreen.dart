import 'package:agrimisr/Modules/Controllers/cart_controller.dart';
import 'package:agrimisr/Modules/Ui/widgets/empty_cart.dart';
import 'package:agrimisr/Modules/Ui/widgets/error_cart.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    Future<void> _pullRefresh() async {
      await cartController.refreshCartItems();
    }

    return Scaffold(
      body: FutureBuilder(
        future: cartController.getCartItems(),
        builder: (context, snapshot) {
          return RefreshIndicator(
            backgroundColor: MyColors.primary,
            color: MyColors.white,
            onRefresh: _pullRefresh,
            child: Stack(
              children: [
                ListView(),
                Obx(() => futureBuilderBody(snapshot, cartController)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget futureBuilderBody(
      AsyncSnapshot<Object?> snapshot, CartController cartController) {
    return cartController.cartState.value == CartState.loading
        ? const Center(
            child: CircularProgressIndicator(
              color: MyColors.primary,
            ),
          )
        : cartController.cartState.value == CartState.empty
            ? const EmptyCart()
            : cartController.cartState.value == CartState.error
                ? const ErrorCart()
                : const Center(
                    child: Text('Cart contains items'),
                  );
  }
}
