import 'package:agrimisr/account/models/address.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

enum EditAdressMode {
  newAddress,
  editAdress,
}

class AddressController extends GetxController {
  final adresses = <Address>[].obs;

  final isLoading = false.obs;

  final editAdressMode = EditAdressMode.newAddress.obs;

  //text editing controllers for the form
  final firstName = TextEditingController().obs;
  final lastName = TextEditingController().obs;
  final firstAdress = TextEditingController().obs;
  final secondAdress = TextEditingController().obs;
  final company = TextEditingController().obs;
  final city = TextEditingController().obs;
  final postalCode = TextEditingController().obs;
  final virtualAddress = false.obs;

  final countryController = ''.obs;
  final governorateController = ''.obs;

  //getters for the text editing controllers
  TextEditingController get firstNameController => firstName.value;
  TextEditingController get lastNameController => lastName.value;
  TextEditingController get firstAdressController => firstAdress.value;
  TextEditingController get secondAdressController => secondAdress.value;
  TextEditingController get companyController => company.value;

  TextEditingController get cityController => city.value;
  TextEditingController get postalCodeController => postalCode.value;

  void newAdressForm({Address? address}) {
    editAdressMode.value =
        address == null ? EditAdressMode.newAddress : EditAdressMode.editAdress;
    firstName.value.text = address?.firstName ?? '';
    lastName.value.text = address?.lastName ?? '';
    firstAdress.value.text = address?.firstAdress ?? '';
    secondAdress.value.text = address?.secondAdress ?? '';
    company.value.text = address?.company ?? '';
    city.value.text = address?.city ?? '';
    postalCode.value.text = address?.postalCode ?? '';
    virtualAddress.value = address?.virtualAdress ?? false;
    countryController.value = address?.country ?? '';
    governorateController.value = address?.governorate ?? '';
  }

  Future<void> getAdresses() async {
    isLoading.value = true;
    //return a dummy account for testing
    await Future.delayed(const Duration(seconds: 2));
    adresses.value = [
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
        company: 'e-aswaaq',
        postalCode: '11111',
        secondAdress: 'this is my second andress',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
      Address(
        id: 1,
        firstName: 'youssef',
        lastName: 'zaka',
        city: 'october',
        country: 'egypt',
        firstAdress: '36 el jabal, 11th district',
        virtualAdress: false,
        governorate: 'giza',
      ),
    ];

    isLoading.value = false;
  }
}
