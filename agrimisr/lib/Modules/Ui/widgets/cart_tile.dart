import 'package:agrimisr/Modules/Controllers/cart_controller.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/text_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

class CartTile extends StatefulWidget {
  const CartTile({Key? key, required this.index, required this.cartController})
      : super(key: key);
  final int index;
  final CartController cartController;

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  @override
  Widget build(BuildContext context) {
    final cartController = widget.cartController;
    final index = widget.index;

    final formKey = GlobalKey<FormState>();
    final qunatTextEditingController = TextEditingController();
    qunatTextEditingController.text =
        cartController.cartItems[index].quantity.toString();
    final quant = cartController.cartItems[index].quantity.obs;
    return Obx(
      () => Padding(
        padding: MyPadding.hvPadding,
        child: Container(
          height: MySize.height * 0.3,
          decoration: BoxDecoration(
            color: MyColors.white,
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.1),
                blurRadius: 2,
                spreadRadius: 3,
              ),
            ],
            borderRadius: MyRadius.mCircularRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MySize.width * 0.35,
                height: double.infinity,
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: MyRadius.mCircularRadius,
                  child: Image.network(
                    cartController.cartItems[index].imageUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: MyColors.primaryDark,
                        ),
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MyPadding.mPadding,
                      ),
                      Padding(
                        padding: MyPadding.hPadding,
                        child: Text(
                          cartController.cartItems[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: MyColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: MyPadding.shPadding,
                        child: TextControllers().customTextFormField(
                          context,
                          onChanged: (value) {
                            //if parsed value is not null and a positive integer set qunat by it
                            if (value == null) return;
                            if (int.tryParse(value) != null &&
                                int.tryParse(value)! > 0) {
                              quant.value = int.tryParse(value)!;
                            }
                          },
                          controller: qunatTextEditingController,
                          prefixWidget: Padding(
                            padding: MyPadding.shPadding,
                            child: Text('${'Cart.Quantity'.tr()}: '),
                          ),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          hintText: 'Cart.Quantity'.tr(),
                          maxLines: 1,
                          keyboardType: TextInputType.number,
                          fixedHeight: false,
                          validator: (value) {
                            if (value == null || int.tryParse(value) == null) {
                              return 'Cart.Validation.Quantity'.tr();
                            }

                            final parsedInt = int.tryParse(value);

                            if (parsedInt == null) {
                              return 'Cart.Validation.Quantity'.tr();
                            }
                            //make sure that the value contains only the 1-9 digits
                            //and the parsed value is not null
                            //and the parsed value is >= cartController.cartItems[index].minQuant
                            //and the parsed value is <= cartController.cartItems[index].maxQuant
                            if (RegExp(r'^[1-9]\d*$').hasMatch(value) &&
                                int.tryParse(value)! >=
                                    cartController.cartItems[index].minQuant &&
                                int.tryParse(value)! <=
                                    cartController.cartItems[index].maxQuant) {
                              return null;
                            }

                            if (parsedInt <
                                cartController.cartItems[index].minQuant) {
                              return 'Cart.Validation.QuantMustBeEqualOrGreaterThan'
                                      .tr() +
                                  cartController.cartItems[index].minQuant
                                      .toString();
                            }
                            if (parsedInt >
                                cartController.cartItems[index].maxQuant) {
                              return 'Cart.Validation.QuantMustBeEqualOrLessThan'
                                      .tr() +
                                  cartController.cartItems[index].maxQuant
                                      .toString();
                            }

                            return 'Cart.Validation.Quantity'.tr();
                          },
                        ),
                      ),
                      const Spacer(),
                      TextControllers().customThreeTextRow(
                        text: cartController.cartItems[index].pricePerItem
                            .toString(),
                        titleText: 'Cart.PricePerItem'.tr(),
                        suffixText: 'Cart.Currency'.tr(),
                      ),
                      TextControllers().customThreeTextRow(
                        text: (cartController.cartItems[index].pricePerItem *
                                quant.value)
                            .toString(),
                        titleText: 'Cart.Total'.tr(),
                        suffixText: 'Cart.Currency'.tr(),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
