import 'package:agrimisr/Modules/Models/productsModel.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

import '../Models/productsModel.dart';

enum ProductsStates {
  loading,
  error,
  success,
}

class ProductsController extends GetxController {
  final ProductsState = ProductsStates.loading.obs;

  final ProductsItem = <ProductsModel>[].obs;

  //request to get the cart items
  Future<void> getProductsItems() async {
    ProductsState.value = ProductsStates.loading;
    await Future.delayed(const Duration(seconds: 2));
    //return some dummy cart items

    ProductsItem.value = [
      ProductsModel(
        id: 1,
        title: 'معلج ملوحة نانو سال- 5 لتر',
        price: 100,
        quantity: 1,
        imageUrl: 'assets/images/0.20824100 1656946916-242x297.jpg',
      ),
      ProductsModel(
        id: 2,
        title:
            'معلج ملوحة نانو سال- 5 لتر معلج ملوحة نانو سال- 5 لترعلج ملوحة نانو سال- 5 لتر معلج ملوحة نانو سال- 5 لتر',
        price: 123,
        quantity: 10,
        imageUrl: 'https://picsum.photos/250/250?random=2',
      ),
      ProductsModel(
        id: 3,
        title: 'little item',
        price: 10,
        quantity: 3,
        imageUrl: 'https://picsum.photos/50/50?random=3',
      ),
      ProductsModel(
        id: 4,
        title: 'Big Image item',
        price: 100,
        quantity: 5,
        imageUrl: 'https://picsum.photos/2000/2000?random=4',
      ),
    ];
    ProductsState.value = ProductsStates.success;
  }

  //request to get the cart items
  Future<void> refreshProductItems() async {
    await getProductsItems();
  }

  //remove item of index from cart
}
