import 'package:agrimisr/account/controllers/account_controller.dart';
import 'package:agrimisr/account/screens/edit_info_screen.dart';
import 'package:agrimisr/core/my_strings.dart';
import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/button_controllers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans hide StringExtension;

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  static const String routeName = '/account';
  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  //account controlelr
  final accountController = Get.put(AccountController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => accountController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
              color: MyColors.primaryDark,
            ))
          : SafeArea(
              child: Scaffold(
                  body: SizedBox(
                height: MySize.height * 0.95,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MySize.height * 0.02), //arrow back
                    Padding(
                      padding: MyPadding.shPadding,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: MyPadding.lPadding * 1.5,
                        ),
                        onPressed: () => Get.back(),
                        color: MyColors.primary,
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    Center(
                      child: SizedBox(
                        width: MySize.width * 0.6,
                        height: MySize.height * 0.2,
                        child: Image.asset(MyStrings.logoPath),
                      ),
                    ),

                    const Spacer(),
                    Padding(
                      padding: MyPadding.hPadding,
                      child: Row(
                        children: [
                          Text(
                            'Settings.Account.Welcome'.tr(),
                            style: TextStyle(
                              fontSize: MySize.width * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: MySize.width * 0.03),
                          Text(
                            '${accountController.account[0].firstName} ${accountController.account[0].lastName}',
                            style: TextStyle(
                              fontSize: MySize.width * 0.05,
                              color: MyColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.04),
                    //4 buttons to navigate to different screens
                    Center(
                      child: ButtonControllers().customRoundedLoaderButton(
                        context,
                        onPressed: () =>
                            goToNextScreen(AccountFormType.editInfo),
                        text: 'Settings.Account.EditAccountInfo'.tr(),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    //4 buttons to navigate to different screens
                    Center(
                      child: ButtonControllers().customRoundedLoaderButton(
                        context,
                        onPressed: () =>
                            goToNextScreen(AccountFormType.editPassword),
                        text: 'Settings.Account.ChangePassword'.tr(),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    //4 buttons to navigate to different screens
                    Center(
                      child: ButtonControllers().customRoundedLoaderButton(
                        context,
                        onPressed: () =>
                            goToNextScreen(AccountFormType.editAdress),
                        text: 'Settings.Account.ChangeAdresses'.tr(),
                      ),
                    ),
                    SizedBox(height: MySize.height * 0.02),
                    //4 buttons to navigate to different screens
                    Center(
                      child: ButtonControllers().customRoundedLoaderButton(
                        context,
                        onPressed: () =>
                            goToNextScreen(AccountFormType.editWishlist),
                        text: 'Settings.Account.ChangeWishlist'.tr(),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              )),
            ),
    );
  }

  //method to go to the next screen
  void goToNextScreen(AccountFormType type) {
    Get.toNamed(EditInfoScreen.routeName, arguments: type);
  }
}
