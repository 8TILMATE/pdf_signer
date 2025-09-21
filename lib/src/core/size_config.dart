import 'dart:io';
import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static bool isPhone = false;
  void init(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;
    isPhone = Platform.isAndroid || Platform.isIOS ? true : false;
  }
}