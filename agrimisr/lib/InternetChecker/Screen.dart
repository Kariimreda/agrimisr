import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/widgets/restartAppWidget.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatefulWidget {
  const NoInternetConnection({Key? key}) : super(key: key);
  static const String routeName = '/NoInternetConnection';

  @override
  State<NoInternetConnection> createState() => _NoInternetConnectionState();
}

class _NoInternetConnectionState extends State<NoInternetConnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SizedBox(
        width: MySize.width,
        height: MySize.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: MyPadding.svPadding,
                child: Icon(
                  Icons.error_outline_rounded,
                  color: MyColors.primaryDark,
                  size: MyPadding.xxlPadding,
                ),
              ),
            ),
            const Expanded(
              child: Text(
                'NO internet connection',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
                child: TextButton(
              child: Text('Try Again'),
              onPressed: () {
                RestartWidget.restartApp(context);
              },
            ))
          ],
        ),
      ),
    ));
  }
}
