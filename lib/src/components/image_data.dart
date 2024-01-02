import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;

  ImageData(this.icon, {Key? key, this.width = 55}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}
