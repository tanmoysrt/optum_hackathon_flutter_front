import 'package:flutter/material.dart';
class VitalInfoMiniCard extends StatelessWidget {
  final String name;
  final String value;
  final String units;
  final String subTitle;
  final Color unitsColor;
  const VitalInfoMiniCard({super.key, required this.name, required this.value, required this.units, required this.subTitle, this.unitsColor=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
      ),
      // width: double.infinity,
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width*0.42,
        maxWidth: MediaQuery.of(context).size.width*0.42
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(name,style: TextStyle(color: Colors.grey[600]), textScaleFactor: 1.15, overflow: TextOverflow.fade, softWrap: false,),
            const SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(value,style: const TextStyle(fontSize: 48, color: Colors.white), ),
                const SizedBox(width: 5),
                Text(units,style: TextStyle(fontSize: 15, color: unitsColor)),
              ],
            ),
            const  SizedBox(height: 5, ),
            Text(subTitle ,style: const TextStyle(fontSize: 12,color: Color(0xffA0A0A0)), textScaleFactor: 1.1, overflow: TextOverflow.fade, softWrap: false,),
          ],
        ),
      ),
    );
  }
}
