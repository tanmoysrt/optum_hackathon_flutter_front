import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VitalDataHorizontalCard extends StatelessWidget {

  final String vitalName;
  final String vitalUnits;
  final String vitalValue;
  final String svgImage;

  const VitalDataHorizontalCard({super.key, required this.vitalName,required this.vitalUnits,required this.vitalValue, required this.svgImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D),
      ),
      child: Padding(
        // padding : EdgeInsets.zero,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vital name
            Text(vitalName,style: TextStyle(color: Colors.grey[600]), textScaleFactor: 1.15,),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Vital value
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    Text(vitalValue,style: const TextStyle(fontSize: 64,color: Colors.white),),
                    const SizedBox(width: 5,),
                    Text(vitalUnits,style: const TextStyle(fontSize: 16,color: Color(0xffff5050)),),
                  ],
                ),
                // Image
               SvgPicture.asset(svgImage, width: MediaQuery.of(context).size.width*0.4)
              ],
            )
          ],
        ),
      ),

    );
  }
}
