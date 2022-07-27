// import 'package:agrimisr/Modules/Controllers/cart_controller.dart';
// import 'package:agrimisr/Modules/Controllers/productsControlller.dart';
// import 'package:agrimisr/Modules/Ui/widgets/drawerProducts/productsItem.dart';
// import 'package:agrimisr/Modules/Ui/widgets/error_cart.dart';
// import 'package:agrimisr/style/my_colors.dart';
// import 'package:agrimisr/style/my_size.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../Controllers/productsControlller.dart';
//
// class Product extends StatefulWidget {
//   const Product(
//       {Key? key, required this.index, required this.productsController})
//       : super(key: key);
//   final int index;
//   final ProductsController productsController;
//
//   @override
//   State<Product> createState() => _ProductState();
// }
//
// class _ProductState extends State<Product> {
//   @override
//   Widget build(BuildContext context) {
//     final index = widget.index;
//     final productsController = Get.put(ProductsController());
//     Future<void> _pullRefresh() async {
//       await productsController.refreshProductItems();
//     }
//
//     return SafeArea(
//       child: Scaffold(
//         body: FutureBuilder(
//           future: productsController.getProductsItems(),
//           builder: (context, snapshot) {
//             return RefreshIndicator(
//               backgroundColor: MyColors.primary,
//               color: MyColors.white,
//               onRefresh: _pullRefresh,
//               child: Stack(
//                 children: [
//                   ProductsItems(
//                       index: index, productsController: productsController),
//                   Obx(() => futureBuilderBody(snapshot, productsController)),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   Widget futureBuilderBody(
//       AsyncSnapshot<Object?> snapshot, ProductsController productsController) {
//     return productsController.productsStates.value == CartState.loading
//         ? const Center(
//             child: CircularProgressIndicator(
//               color: MyColors.primary,
//             ),
//           )
//         : ProductsController.productsStates.value == ProductsStates.error
//             ? const ErrorCart()
//             : Padding(
//                 padding: EdgeInsets.only(top: MySize.height * 0.05),
//                 child: ProductsItems(productsController: productsController, index: index,),
//               );
//   }
// }
