import 'package:agrimisr/auth/widgets/login_form.dart';
import 'package:agrimisr/auth/widgets/signup_text.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: width,
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              SizedBox(
                width: width * 0.6,
                height: height * 0.2,
                child: Image.asset('assets/images/logo.png'),
              ),
              SizedBox(height: height * 0.01),
              const SignUpText(),
              SizedBox(height: height * 0.01),
              LoginForm(emailController: emailController),
            ],
          ),
        ),
      ),
    );
  }
}
