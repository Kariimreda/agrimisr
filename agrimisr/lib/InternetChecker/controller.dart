import 'package:agrimisr/InternetChecker/Screen.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker extends GetxController {
  var hasInternet = false.obs;
  void checkForInternet() async {
    hasInternet.value = await InternetConnectionChecker().hasConnection;
    if (!hasInternet.value) {
      Get.snackbar(
        'No Internet Connection',
        'Check your connectivity and try again',
      );
      Get.offAllNamed(NoInternetConnection.routeName);
    }
  }
}
