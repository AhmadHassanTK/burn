import 'package:flutter/material.dart';

class SizeConfig {
  static double? screenwidth;
  static double? screenheight;
  static double? defaultsize;
  static Orientation? orientation;

  void init(BuildContext context) {
    screenwidth = MediaQuery.of(context).size.width;
    screenheight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultsize = orientation == Orientation.landscape
        ? screenheight! * 0.024
        : screenwidth! * 0.024;

    print("the default size is $defaultsize");
  }
}
