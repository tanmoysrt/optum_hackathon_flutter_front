import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/button.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Detection History"),
        automaticallyImplyLeading: false
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              _alertCard(context),
              _alertCard(context),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _alertCard(BuildContext context){
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    width: double.infinity,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      color: Color(0xff0D0D0D),
    ),
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
    child: Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/images/medium_risk.svg", width: 80, ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Heart Failure", textScaleFactor: 1.5,),
                    const SizedBox(width: 10,),
                    Icon(Icons.info_outline, color: Colors.blue,size: 18,),
                  ],
                ),
                const SizedBox(height: 5,),
                // TODO Substring .substring(0,34)
                Text("Reported by : Heart Rate Predictor", textScaleFactor: 1, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey.shade400),),
                const SizedBox(height: 2,),
                Text("Detected On : 22:55 , 21 Jun 2022", textScaleFactor: 1, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey.shade400),),
              ],
            )
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StyledButton(textInside: "Mark as resolved", fractionalWidth: 0.38, fractionalHeight: 0.05, bgColor: Color(0xFF2E7A00),textSize: 12,),
            StyledButton(textInside: "Consult Specialist", fractionalWidth: 0.38, fractionalHeight: 0.05, bgColor: Color(0xFF004A7F), textSize: 12,),
          ],
        )
      ],
    ),
  );
}