import 'package:get/get.dart' hide Trans hide StringExtension;

enum CartState {
  loading,
  empty,
  error,
  containsItems,
}

class CartController extends GetxController {
  final cartState = CartState.loading.obs;

  //request to get the cart items
  Future<void> getCartItems() async {
    cartState.value = CartState.loading;
    await Future.delayed(const Duration(seconds: 2));
    cartState.value = CartState.empty;
  }

  //request to get the cart items
  Future<void> refreshCartItems() async {
    await Future.delayed(const Duration(seconds: 2));
    cartState.value = CartState.error;
  }
}
