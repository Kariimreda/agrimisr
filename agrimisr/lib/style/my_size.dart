import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MySize {
  static double width = Get.width;
  static double height = Get.height;
}

class MyPadding {
  static final hPadding = EdgeInsets.symmetric(horizontal: MySize.width * 0.05);
  static final shPadding =
      EdgeInsets.symmetric(horizontal: MySize.width * 0.02);
  static final vPadding =
      EdgeInsets.symmetric(horizontal: MySize.height * 0.03);
  static final svPadding =
      EdgeInsets.symmetric(horizontal: MySize.height * 0.01);

  static final hvPadding = EdgeInsets.symmetric(
    horizontal: MySize.width * 0.1,
    vertical: MySize.height * 0.05,
  );
  static final sPadding = MySize.width * 0.01;
  static final mPadding = MySize.width * 0.03;
  static final lPadding = MySize.width * 0.05;
  static final xlPadding = MySize.width * 0.1;
}

class MyRadius {
  static final BorderRadius sCircularRadius =
      BorderRadius.circular(MyPadding.sPadding);
  static final BorderRadius mCircularRadius =
      BorderRadius.circular(MyPadding.mPadding);
}
