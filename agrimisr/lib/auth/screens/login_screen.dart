import 'package:agrimisr/auth/widgets/login_form.dart';
import 'package:agrimisr/core/locales.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final localeController = Get.put(MyLocales());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02),
              SizedBox(
                width: width * 0.6,
                height: height * 0.2,
                child: Image.asset('assets/images/logo.png'),
              ),
               LoginForm(localeController: localeController),
            ],
          ),
        ),
      ),
    );
  }
}
