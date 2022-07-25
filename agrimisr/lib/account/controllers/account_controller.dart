import 'package:agrimisr/account/models/account.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

enum AccountFormType {
  editInfo,
  editPassword,
  editAdress,
  editWishlist,
}

class AccountController extends GetxController {
  final account = <Account>[].obs;

  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAccount();
  }

  void getAccount() async {
    isLoading.value = true;
    //return a dummy account for testing
    await Future.delayed(const Duration(seconds: 2));
    account.add(
      Account(
          id: 1, firstName: 'youssef', lastName: 'zaka', phone: '01064504003'),
    );
    isLoading.value = false;
  }
}
