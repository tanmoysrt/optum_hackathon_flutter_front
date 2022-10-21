import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:widget_mask/widget_mask.dart';

class DynamicIcon extends StatelessWidget {
  final String assetImage;
  double fillPercentage;
  final Color fillColor;
  final Color backgroundColor;
  final double height;
  final double width;
  final bool isHorizontalFill; // By default false

  DynamicIcon({Key? key, required this.assetImage, required this.fillPercentage, required this.fillColor, this.backgroundColor=Colors.transparent, required this.height, required this.width, this.isHorizontalFill=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fillPercentage = min(fillPercentage, 1);
    return WidgetMask(
      blendMode: BlendMode.srcATop,
      childSaveLayer: true,
      mask: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              height: isHorizontalFill ? height : height * (1 - fillPercentage),
              width: isHorizontalFill ? width * (1 - fillPercentage) : width,
              color: backgroundColor,
            ),
            Container(
              height: isHorizontalFill ? height :  height * fillPercentage,
              width: isHorizontalFill ? width * fillPercentage : width,
              color: fillColor,
            ),
          ],
        ),
      ),
      child: Image.asset(assetImage, height: height, width: width,),
      // child: Icon(Icons.local_fire_department_outlined, size: 40,),
    );
  }
}
