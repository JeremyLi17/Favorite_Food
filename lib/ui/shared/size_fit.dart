import 'dart:ui';

class SizeFit {
  static late double physicalWidth;
  static late double physicalHeight;
  static late double screenWidth;
  static late double screenHeight;
  static late double dpr;
  static late double rpx;
  static late double px;

  static void initialize({double standardSize = 1170.0}) {
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    dpr = window.devicePixelRatio;

    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;

    rpx = screenWidth / standardSize;
    // iPhone13 @3x, iPhone8,SE @2x
    px = rpx * 2;
  }

  static double setPx(double size) {
    return px * size;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPercentageWidth(double percentage) {
    return percentage * screenWidth;
  }

  static double setPercentageHeight(double percentage) {
    return percentage * screenHeight;
  }
}