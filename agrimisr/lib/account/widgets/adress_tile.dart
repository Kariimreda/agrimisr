import 'package:agrimisr/account/controllers/adress_controller.dart';
import 'package:agrimisr/account/models/address.dart';
import 'package:agrimisr/account/widgets/edit_adress_form.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;
import 'package:easy_localization/easy_localization.dart';

class AdressTile extends StatefulWidget {
  const AdressTile(
      {Key? key, required this.index, required this.addressController})
      : super(key: key);

  final int index;
  final AddressController addressController;
  @override
  State<AdressTile> createState() => _AdressTileState();
}

class _AdressTileState extends State<AdressTile> {
  @override
  Widget build(BuildContext context) {
    final addressController = widget.addressController;
    final Address address = addressController.adresses[widget.index];
    //return a tile with the adress information and a button to edit/remove it
    return Padding(
      padding: MyPadding.hvPadding,
      child: ListTile(
        tileColor: MyColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: MyRadius.mCircularRadius,
        ),
        title: Text(
          '${address.firstAdress} ${address.lastName}',
          style: const TextStyle(
            color: MyColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(''),
            if (address.company != null) Text(address.company!),
            Text(address.firstAdress),
            if (address.secondAdress != null) Text(address.secondAdress!),
            Text('${address.city} ${address.postalCode ?? ''}'),
            Text('${address.governorate}, ${address.country}'),
            const Text(''),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                //edit the adress
                //Reset the form
                addressController.newAdressForm(address: address);
                //open add/edit adress form in bottom sheet
                Get.bottomSheet(
                  EditAdressForm(addressController: addressController),
                  isScrollControlled: true,
                  enableDrag: true,
                  isDismissible: true,
                  ignoreSafeArea: false,
                );
              },
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: MyColors.error.withOpacity(0.75),
              ),
              onPressed: () {
                //delete the adress
                //ask the user if he wants to delete the adress
                Get.dialog(
                  AlertDialog(
                    title: Text('Settings.Remove'.tr()),
                    content: Text('Settings.AreYouSure'.tr()),
                    actions: [
                      TextButton(
                        child: Text('Settings.Cancel'.tr(),
                            style: const TextStyle(color: MyColors.black)),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      TextButton(
                        child: Text('Settings.Remove'.tr(),
                            style: const TextStyle(color: MyColors.error)),
                        onPressed: () {
                          //delete the adress
                          Get.back();
                          addressController.adresses.removeAt(widget.index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
