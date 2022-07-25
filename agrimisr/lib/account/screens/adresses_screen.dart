import 'package:agrimisr/account/controllers/account_controller.dart';
import 'package:agrimisr/account/controllers/adress_controller.dart';
import 'package:agrimisr/account/widgets/adress_tile.dart';
import 'package:agrimisr/account/widgets/edit_adress_form.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

class AdressesScreen extends StatefulWidget {
  const AdressesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdressesScreen> createState() => _AdressesScreenState();
}

class _AdressesScreenState extends State<AdressesScreen> {
  @override
  Widget build(BuildContext context) {
    //create 2 keys for the form
    final formKey = GlobalKey<FormState>();
    final addressController = Get.put(AddressController());

    return FutureBuilder(
      future: addressController.getAdresses(),
      builder: (context, snapshot) {
        return Obx(
          () => addressController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(
                  color: MyColors.primaryDark,
                ))
              : Column(
                  children: [
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      onPressed: () {
                        //open add/edit adress form in bottom sheet
                        Get.bottomSheet(
                          EditAdressForm(addressController: addressController),
                          isScrollControlled: true,
                          enableDrag: true,
                          isDismissible: true,
                          ignoreSafeArea: false,
                        );
                      },
                      text: 'Settings.AddAddress'.tr(),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.hardEdge,
                      itemBuilder: (context, index) {
                        return AdressTile(
                          index: index,
                          addressController: addressController,
                        );
                      },
                      itemCount: addressController.adresses.length,
                    ),
                  ],
                ),
        );
      },
    );
  }

  //on pressed function for login button
  void editPassword(
    final formKey,
    final AccountController accountController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {
      accountController.editPassword();
    }
  }
}
