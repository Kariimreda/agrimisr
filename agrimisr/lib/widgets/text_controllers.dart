import 'package:agrimisr/style/my_colors.dart';
import 'package:agrimisr/style/my_size.dart';
import 'package:agrimisr/style/size_config.dart';
import 'package:flutter/material.dart';
// import 'package:visit_egypt/CommonWidgets/CustomTextWidget.dart';
// import 'package:visit_egypt/Resources/Colors.dart';
// import 'package:visit_egypt/Resources/AppRepoSizes.dart';
// import 'package:visit_egypt/Resources/sizes.dart';
// import 'package:visit_egypt/utility/SizeConfig.dart';

class TextControllers {
  TextControllers._internal();

  static final TextControllers _instance = TextControllers._internal();

  factory TextControllers() => _instance;

  Widget customTextFormField(BuildContext context,
          {TextEditingController? controller,
          AutovalidateMode? autovalidateMode,
          EdgeInsetsGeometry? padding,
          FormFieldValidator<String>? validator,
          bool? fixedHeight = false,
          String? hintText,
          String? titleText,
          bool isObscureText = false,
          double? fontSize,
          double? hintFontSize,
          double? fieldHeight,
          double? fieldWidth,
          Color? textFieldColor,
          Color? fillColor,
          Color? textColor,
          Color? borderColor,
          Color? hintTextColor,
          Color? titleTextColor,
          Widget? prefixWidget,
          Widget? endPrefixWidget,
          Widget? titlePrefixWidget,
          int? maxLines,
          FocusNode? focusNode,
          VoidCallback? onTap,
          VoidCallback? onEditingComplete,
          VoidCallback? onPressVCL,
          EdgeInsetsGeometry? margin,
          EdgeInsetsGeometry? contentPadding,
          TextInputType? keyboardType,
          TextInputAction? textInputAction,
          bool readOnly = false,
          BorderRadiusGeometry? borderRadius,
          GlobalKey<FormFieldState>? formKey}) =>
      Container(
        padding: padding ?? EdgeInsets.zero,
        height: fixedHeight!
            ? fieldHeight ?? SizeConfig().safeBlockVertical * 6
            : null,
        width: fieldWidth ?? MySize.width * 0.9,
        decoration: BoxDecoration(
          color: fillColor ?? MyColors.transparent,
          border: Border.all(color: borderColor ?? MyColors.grey!),
          borderRadius: borderRadius ?? MyRadius.mCircularRadius,
          // Border(
          //     bottom: BorderSide(
          //         color: AppRepoColors().appGreyColor,
          //         width: SizeConfig.safeBlockHorizontal * 0.5)
          // ),
        ),
        child: Padding(
          padding: MyPadding.svPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.ideographic,
            verticalDirection: VerticalDirection.up,
            children: [
              prefixWidget ?? Container(),
              if (prefixWidget != null) SizedBox(width: MySize.width / 60),
              Expanded(
                child: TextFormField(
                  key: formKey,
                  readOnly: readOnly,
                  textInputAction: textInputAction ?? TextInputAction.done,
                  focusNode: focusNode,
                  obscureText: isObscureText,
                  controller: controller,
                  maxLines: maxLines ?? 1,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: textColor, fontSize: fontSize),
                  keyboardType: keyboardType,
                  onTap: onTap ?? () {},
                  onEditingComplete: onEditingComplete ?? () {},
                  validator: validator,
                  decoration: InputDecoration(
                    // labelText: titleText ?? '',
                    counterText: '',
                    isDense: true,
                    counterStyle: const TextStyle(fontSize: 0),
                    contentPadding: contentPadding ?? EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: hintText,

                    hintStyle: TextStyle(
                      color: hintTextColor,
                      fontSize: hintFontSize,
                    ),

                    errorStyle: TextStyle(
                        color: MyColors.error, fontSize: hintFontSize),
                  ),
                  autovalidateMode:
                      autovalidateMode ?? AutovalidateMode.disabled,
                ),
              ),
              endPrefixWidget ?? Container(),
            ],
          ),
        ),
      );

  // Widget customRoundedTextFormField(
  //         {TextEditingController? controller,
  //          Function? validator,
  //          Function? onChanged,
  //         String? hintText,
  //         bool isObscureText = false,
  //         double? fontSize,
  //         double? hintFontSize,
  //         double? fieldHeight,
  //         Color? textFieldColor,
  //         // Color fillColor,
  //         Color? textColor,
  //         Color? borderColor,
  //         Color? hintTextColor,
  //         Color? boxDecorationColor,
  //         Widget? suffixWidget,
  //         Widget? prefixWidget,
  //         int? maxLines,
  //         FocusNode? focusNode,
  //         Function? onTap,
  //         VoidCallback? onPressVCL,
  //         EdgeInsetsGeometry? margin,
  //         EdgeInsetsGeometry? contentPadding,
  //         TextInputType? keyboardType,
  //         GlobalKey<FormFieldState>? formKey}) =>
  //     TextFormField(
  //       key: formKey,
  //       obscureText: isObscureText,
  //       controller: controller,
  //       maxLines: maxLines ?? 1,
  //       textAlign: TextAlign.start,
  //       textAlignVertical: TextAlignVertical.center,
  //       style: TextStyle(color: textColor, fontSize: fontSize, fontFamily: ""),
  //       keyboardType: keyboardType,
  //       onTap: ()=> onTap ?? () {},
  //       // validator: validator(),
  //       // onChanged: onChanged(),
  //       cursorColor: AppRepoColors().appMainColor,
  //       cursorHeight: SizeConfig.safeBlockVertical * 2.5,
  //       decoration: InputDecoration(
  //           counterText: '',
  //           fillColor: boxDecorationColor ??
  //               AppRepoColors().appWhiteColor.withOpacity(0.2),
  //           filled: true,
  //            border: OutlineInputBorder(
  //             borderSide: BorderSide(color: MyColors.transparent,),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           focusedBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: MyColors.transparent,),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //          enabledBorder: OutlineInputBorder(
  //            borderSide: BorderSide(color: MyColors.transparent,),
  //            borderRadius: BorderRadius.circular(8.0),
  //          ),
  //           errorBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: AppRepoColors().appLightGreyColor.withOpacity(0.34),),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           disabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: AppRepoColors().appLightGreyColor.withOpacity(0.34),),
  //             borderRadius: BorderRadius.circular(8.0),
  //           ),
  //           counterStyle: TextStyle(fontSize: 0),
  //           contentPadding: contentPadding ?? EdgeInsets.zero,
  //           hintText: hintText,
  //           hintStyle: TextStyle(color: hintTextColor, fontSize: hintFontSize),
  //           errorMaxLines: 1,
  //           errorStyle: TextStyle(
  //               color: MyColors.error, fontSize: hintFontSize),
  //           suffixIcon: suffixWidget,
  //           prefixIcon: prefixWidget),
  //     );

  // Widget customTitledTextFormField(BuildContext context, {
  //   TextEditingController? controller,
  //   String? titleText,
  //   String? hintText,
  //   bool isObscureText = false,
  //   double? fontSize,
  //   double? hintFontSize,
  //   double? fieldHeight,
  //   Color? textFieldColor,
  //   Color? textColor,
  //   Color? borderColor,
  //   Color? hintTextColor,
  //   Icon? suffixIcon,
  //   int? maxLines,
  //   FocusNode? focusNode,
  //   Function? onTap,
  //   VoidCallback? onPressVCL,
  //   Widget? titlePrefixWidget,
  //   Widget? suffixWidget,
  //   EdgeInsetsGeometry? contentPadding,
  //   TextInputType? keyboardType,
  //   TextAlign? textAlign,
  //   GlobalKey<FormFieldState>? formKey,
  //   required Function validator,
  // }) =>
  //     Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         Padding(
  //           padding: EdgeInsets.symmetric(
  //               vertical: SizeConfig.safeBlockHorizontal * 4),
  //           child: CustomTextWidget().customWidgetWithText(context,
  //             text: titleText ?? '',
  //             textColor: AppRepoColors().appBlackColor,
  //             textAlign: TextAlign.start,
  //             fontSize: Sizes.fontSizes(context)['h5'],
  //             fontWeight: FontWeight.w400,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             prefixWidget: titlePrefixWidget ?? Container(),
  //             spacerWidget: SizedBox(
  //               width: SizeConfig.safeBlockHorizontal * 2,
  //             ),
  //           ),
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             // CustomTextWidget().customWidgetWithText(context,
  //             //   text: titleText ?? '',
  //             //   fontSize: Sizes.fontSizes(context)['h6'],
  //             //   textColor: titleTextColor ?? AppRepoColors().appBlackColor,
  //             //   fontWeight: FontWeight.w400,
  //             //   textAlign: TextAlign.start,
  //             // ),
  //             TextFormField(
  //               key: formKey,
  //               obscureText: isObscureText,
  //               controller: controller,
  //               maxLines: maxLines ?? 1,
  //               textAlign: TextAlign.start,
  //               style: TextStyle(color: textColor, fontSize: fontSize),
  //               keyboardType: keyboardType,
  //               onTap: ()=>onTap ?? () {},
  //               validator: validator(),
  //               decoration: InputDecoration(
  //                   counterText: '',
  //                   counterStyle: TextStyle(fontSize: 0),
  //                   contentPadding: contentPadding ??
  //                       EdgeInsets.symmetric(
  //                           horizontal: SizeConfig.safeBlockHorizontal * 8,
  //                           vertical: 0),
  //                   border: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius),
  //                   enabledBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   focusedBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   disabledBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: borderColor ??
  //                               MyColors.transparent,
  //                           width: SizeConfig.safeBlockHorizontal * 0.2)),
  //                   hintText: hintText ?? '',
  //                   hintStyle:
  //                       TextStyle(color: hintTextColor, fontSize: hintFontSize),
  //                   errorMaxLines: 1,
  //                   errorStyle: TextStyle(
  //                       color: MyColors.error,
  //                       fontSize: hintFontSize),
  //                   errorBorder: OutlineInputBorder(
  //                       borderRadius: AppRepoSizes().circleCornerRadius,
  //                       borderSide: BorderSide(
  //                           color: MyColors.error,
  //                           width: SizeConfig.safeBlockHorizontal * 0.1)),
  //                   suffixIcon: suffixIcon != null
  //                       ? IconButton(
  //                           onPressed: onPressVCL,
  //                           icon: suffixIcon,
  //                         )
  //                       : SizedBox(
  //                           width: 0.0,
  //                         )),
  //             ),
  //           ],
  //         ),
  //       ],
  //     );

}
