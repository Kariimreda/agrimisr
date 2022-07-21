import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:flutter/material.dart';

class ButtonControllers {
  ButtonControllers._internal();

  static final ButtonControllers _instance = ButtonControllers._internal();

  factory ButtonControllers() => _instance;

  //custom Rounded Button with text
  Widget customRoundedLoaderButton(
    BuildContext context, {
    String? text,
    void Function()? onPressed,
    Color? color,
    Color? textColor,
    double? fontSize,
    BorderRadius? borderRadius,
    double? height,
    double? width,
    EdgeInsets? padding,
    final controller,
    final isLoading,
  }) {
    return Container(
      width: width ?? MySize.width * 0.9,
      height: height ?? MySize.height * 0.06,
      padding: padding ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color ?? MyColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? MyRadius.lCircularRadius,
          ),
        ),
        child: isLoading == null
            ? Text(
                text ?? '',
                style: TextStyle(
                  color: textColor ?? MyColors.white,
                  fontSize: fontSize ?? MySize.width * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              )
            : isLoading.value
                ? const CircularProgressIndicator(
                    color: MyColors.white,
                  )
                : Text(
                    text ?? '',
                    style: TextStyle(
                      color: textColor ?? MyColors.white,
                      fontSize: fontSize ?? MySize.width * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
      ),
    );
  }

  Widget drawerTextButton(
    BuildContext context, {
    required String? text,
    void Function()? onPressed,
    // Color? color,
    Icon? Icons,
    EdgeInsets? padding,
  }) {
    return Container(
      padding: padding ?? EdgeInsets.all(10.0),
      color: MyColors.background,
      child: Row(
        children: [Text(text!), Spacer(), Icons ?? SizedBox.shrink()],
      ),
    );
  }
}
