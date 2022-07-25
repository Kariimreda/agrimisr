import 'package:agrimisr/account/controllers/adress_controller.dart';
import 'package:agrimisr/core/custom_validator.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:agrimisr/widgets/text_controllers.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' show Obx;

class EditAdressForm extends StatefulWidget {
  const EditAdressForm({
    Key? key,
    required this.addressController,
  }) : super(key: key);

  final AddressController addressController;

  @override
  State<EditAdressForm> createState() => _EditAdressFormState();
}

class _EditAdressFormState extends State<EditAdressForm> {
  @override
  Widget build(BuildContext context) {
    final addressController = widget.addressController;
    //create 2 keys for the form
    final formKey = GlobalKey<FormState>();

    String countryValue = "";
    String stateValue = "";
    String cityValue = "";

    return Scaffold(
      body: Obx(
        () {
          return ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: MySize.height * 0.1),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Settings.Address.FirstName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.lastNameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      hintText: 'Settings.Address.LastName'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.companyController,
                      hintText: 'Settings.Address.Company'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstAdressController,
                      hintText: 'Settings.Address.FirstAddress'.tr(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.secondAdressController,
                      hintText: 'Settings.Address.SecondAddress'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.cityController,
                      hintText: 'Settings.Address.City'.tr(),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator:
                          MyValidators.instance.getNameValidator().build(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    TextControllers().customTextFormField(
                      context,
                      padding: MyPadding.hPadding,
                      keyboardType: TextInputType.name,
                      controller: addressController.firstAdressController,
                      hintText: 'Settings.Address.PostalCode'.tr(),
                      contentPadding: const EdgeInsets.only(bottom: 5),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    Padding(
                      padding: MyPadding.hPadding,
                      child: CSCPicker(
                        showCities: false,
                        countryDropdownLabel: 'Settings.Address.Country'.tr(),
                        onCityChanged: (_) {},
                        stateDropdownLabel: 'Settings.Address.Governorate'.tr(),

                        ///triggers once country selected in dropdown
                        onCountryChanged: (value) {
                          countryValue = value;
                          setState(() {
                            addressController.countryController.text = value;
                          });
                        },

                        ///triggers once state selected in dropdown
                        onStateChanged: (value) {
                          if (value == null) return;
                          stateValue = value;
                          setState(() {
                            addressController.governorateController.text =
                                value;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.01),
                    ButtonControllers().customRoundedLoaderButton(
                      context,
                      text: 'Auth.Signup.Next'.tr(),
                      controller: addressController,
                      onPressed: () => editInfo(formKey, addressController),
                      isLoading: addressController.isLoading,
                    ),
                    SizedBox(height: MySize.height * 0.01),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //on pressed function for login button
  void editInfo(
    final formKey,
    final AddressController addressController,
  ) {
    //validate all using form keys
    if (formKey.currentState!.validate()) {}
  }
}
