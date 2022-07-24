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
        title:
            'معلج ملوحة نانو سال- 5 لتر معلج ملوحة نانو سال- 5 لترعلج ملوحة نانو سال- 5 لتر معلج ملوحة نانو سال- 5 لتر',
        pricePerItem: 1000000000000000000,
        quantity: 50,
        total: 5000000000000000000,
        imageUrl: 'https://picsum.photos/250/250?random=2',
        minQuant: 50,
        maxQuant: 70,
      ),
      CartItem(
        id: 3,
        title: 'little item',
        pricePerItem: 10,
        quantity: 3,
        total: 30,
        imageUrl: 'https://picsum.photos/50/50?random=3',
        minQuant: 1,
        maxQuant: 10,
      ),
      CartItem(
        id: 4,
        title: 'Big Image item',
        pricePerItem: 100,
        quantity: 5,
        total: 100,
        imageUrl: 'https://picsum.photos/2000/2000?random=4',
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
