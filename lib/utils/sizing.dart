import 'package:flutter/material.dart';

class Sizing {
  final BuildContext context;
  Sizing(
    {
      required this.context
    }
  );

  static Sizing _instance;

  static Sizing getInstance({BuildContext? ctx}) {
    _instance ??= Sizing(context: this.context);
    return _instance;
  }
  


  

  static  getCurrentDeviceSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static  getCurrentDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static  getCurrentDeviceHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width


}