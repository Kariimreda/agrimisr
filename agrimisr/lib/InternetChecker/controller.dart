import 'package:agrimisr/InternetChecker/Screen.dart';
import 'package:agrimisr/Layout/Ui/Layout.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker extends GetxController {
  var hasInternet = false.obs;
  void checkForInternet() async {
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    if (!hasInternet.value) {
      Get.offAll(NoInternetConnection());
    } else {
      Get.offAll(Layout.routeName);
    }
  }
}
