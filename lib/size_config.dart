import 'package:flutter/material.dart';


class SizeConfig{
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth, screenHeight, blockSizeHorizontal, blockSizeVertical;

  void init(BuildContext context){
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHeight! / 100;

  }
}