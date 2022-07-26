import 'package:agrimisr/product/models/product.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:like_button/like_button.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  static const routeName = '/product';
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  //arguments from the previous screen
  final product = Get.arguments as Product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: MyPadding.hPadding,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => Get.back(),
              color: MyColors.primary,
              iconSize: MySize.height * 0.03,
            ),
          ),
          title: Text(
            product.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: MyColors.primary,
              fontSize: MySize.height * 0.025,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: MyPadding.hPadding,
              child: LikeButton(
                likeBuilder: (bool isLiked) {
                  return Icon(
                    isLiked
                        ? Icons.favorite_rounded
                        : Icons.favorite_border_rounded,
                    color: isLiked ? MyColors.error : MyColors.grey,
                    size: MySize.height * 0.035,
                  );
                },
              ),
            ),
          ],
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MySize.height * 0.4,
              width: MySize.width,
              child: Image.network(
                product.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Padding(
              padding: MyPadding.hPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Text(
                      product.seller,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MySize.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  FittedBox(
                    child: Text(
                      product.weight,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MySize.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  FittedBox(
                    child: Text(
                      product.quantity.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MySize.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  const Divider(),
                  FittedBox(
                    child: Text(
                      product.price.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MySize.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  const Divider(),
                  FittedBox(
                    child: Text(
                      product.min.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: MySize.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.01),
                  Center(
                    child: ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Add to cart',
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: MySize.height * 0.05),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
