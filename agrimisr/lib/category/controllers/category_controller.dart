import 'package:agrimisr/category/models/category.dart';
import 'package:agrimisr/product/models/product.dart';
import 'package:get/get.dart' hide Trans;

enum CategoryState {
  loading,
  empty,
  error,
  containsItems,
}

class CategoryController extends GetxController {
  final products = <Product>[].obs;
  final isLoading = false.obs;
  final categoryState = CategoryState.loading.obs;
  void getProducts(Category category) async {
    categoryState.value = CategoryState.loading;
    await Future.delayed(const Duration(seconds: 2));
    // final path = category.path;
    products.value = [
      Product(
        id: 1,
        imageUrl:
            'https://agrimisr.com/image/cache/folder_98/0.03551100%201656332878-443x545.jpg',
        min: 4,
        price: 1023,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات هيومازد ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 2,
        imageUrl: 'https://picsum.photos/1000?random=1',
        min: 4,
        price: 50,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات هيومازد ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 23,
        imageUrl: 'https://picsum.photos/1000?random=2',
        min: 4,
        price: 600,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات هيومازد ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 4,
        imageUrl: 'https://picsum.photos/1000?random=3',
        min: 4,
        price: 5120,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات هيومازد ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 5,
        imageUrl: 'https://picsum.photos/1000?random=4',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 6,
        imageUrl: 'https://picsum.photos/1000?random=5',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات ',
        weight: '500g',
        wishlisted: false,
      ),
      Product(
        id: 7,
        imageUrl: 'https://picsum.photos/1000?random=6',
        min: 4,
        price: 1,
        quantity: 1000,
        rating: 4.5,
        seller: ' شركة كفر الزيات للمبيدات و الكيماويات ',
        title: 'مبيدات ',
        weight: '500g',
        wishlisted: false,
      ),
    ];
    categoryState.value = CategoryState.containsItems;
    isLoading.value = false;
  }
}
