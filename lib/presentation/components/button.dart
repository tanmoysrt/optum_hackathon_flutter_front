import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  final String textInside;
  final Function? onPressed;
  final Color? bgColor;
  final Color? textColor;
  final double? fractionalWidth;
  final double? fractionalHeight;
  final double? textSize;
  final bool outlined;
  const StyledButton({super.key, required this.textInside, this.onPressed, this.bgColor, this.textColor, this.fractionalWidth, this.fractionalHeight, this.textSize, this.outlined=false});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width*(fractionalWidth??0.87);
    double buttonHeight = MediaQuery.of(context).size.height*(fractionalHeight??0.06);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed == null ? (){} : ()=>onPressed!(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(2),),
          color:  outlined ? Colors.transparent : (bgColor??const Color(0xff4081FF)),
          border: Border.all(color: outlined ? (bgColor??const Color(0xff4081FF)) : Colors.transparent, width: 1),
        ),

        height: buttonHeight,
        width: buttonWidth,
        child: Center(child: Text(textInside,style: TextStyle(fontFamily: 'Rounded',color: textColor??Colors.white,fontSize: textSize??14),),),
      ),
    );
  }
}

