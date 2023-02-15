import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ScaleConfig {
  // static MediaQueryData mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;

  static double pixelRatio;
  static double textScaleFactor;
  static double statusBarHeight;
  static double bottomBarHeight;
  static double scaleFactor;
  static Size uiSize;

  void init(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    orientation = mediaQueryData.orientation;

    var window = WidgetsBinding.instance?.window ?? ui.window;
    pixelRatio = window.devicePixelRatio;
    statusBarHeight = window.padding.top;
    bottomBarHeight = window.padding.bottom;
    textScaleFactor = window.textScaleFactor;
    scaleFactor = mediaQueryData.orientation == Orientation.portrait ? mediaQueryData.size.width / 375 : mediaQueryData.size.width / 838;
  }
}

double setWidth(num width) {
  return width * ScaleConfig.scaleFactor;
}

double setHeight(num height) {
  return height * ScaleConfig.scaleFactor;
}

double setRadius(num radius) {
  return radius * ScaleConfig.scaleFactor;
}

double setSp(num fontSize) {
  return fontSize * (1 / ScaleConfig.textScaleFactor) * ScaleConfig.scaleFactor;
}

extension SizeExtension on num {
  double get w => setWidth(this);
  double get h => setHeight(this);
  double get r => setRadius(this);
  double get sp => setSp(this);
}
