import 'package:agrimisr/Modules/Models/cart_item.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

enum CartState {
  loading,
  empty,
  error,
  containsItems,
}

class CartController extends GetxController {
  final cartState = CartState.loading.obs;

  final cartItems = <CartItem>[].obs;

  //request to get the cart items
  Future<void> getCartItems() async {
    cartState.value = CartState.loading;
    await Future.delayed(const Duration(seconds: 2));
    //return some dummy cart items

    cartItems.value = [
      CartItem(
        id: 1,
        title: 'معلج ملوحة نانو سال- 5 لتر',
        pricePerItem: 100,
        quantity: 1,
        total: 100,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.27603300%201656332880-242x297.jpg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 2,
        title: 'نخل برحى متر خشب',
        pricePerItem: 123,
        quantity: 10,
        total: 1230,
        imageUrl:
            'https://agrimisr.com/image/cache/mshtl-alkhlyj/Untitled-1-242x297.jpg',
        minQuant: 2,
        maxQuant: 15,
      ),
      CartItem(
        id: 3,
        title: 'جيست',
        pricePerItem: 10.23,
        quantity: 3,
        total: 30,
        imageUrl: 'https://agrimisr.com/image/cache/keymanda/13-252x309.jpg',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 4,
        title: 'سينوزد - 1 كيلو',
        pricePerItem: 100,
        quantity: 5,
        total: 100,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.30453800%201656332856-252x309.jpg',
        minQuant: 5,
        maxQuant: 10,
      ),
    ];
    cartState.value = CartState.containsItems;
  }

  //request to get the cart items
  Future<void> refreshCartItems() async {
    await getCartItems();
  }

  //remove item of index from cart
  void removeItem(int index) {
    cartItems.removeAt(index);
    if (cartItems.isEmpty) {
      cartState.value = CartState.empty;
    }
  }
}
