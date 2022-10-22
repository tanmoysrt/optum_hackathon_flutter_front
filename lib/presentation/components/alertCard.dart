import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:optum_hackathon/presentation/components/button.dart';

class AlertCard extends StatelessWidget {


  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Heart Failure", textScaleFactor: 1.5,),
          const SizedBox(height: 10),
          SvgPicture.asset("assets/images/medium_risk.svg"),
          const SizedBox(height: 15,),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Text("This is the main cause of tthe alert messages.So be prepared to die", textScaleFactor: 1.2, textAlign: TextAlign.center,)
          ),
          const SizedBox(height: 20,),
          FractionallySizedBox(
            widthFactor: 0.9,
            child: Text("Reported by : Heart Rate Predictor", textScaleFactor: 1, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade400),)
          ),
          const SizedBox(height: 2,),
          FractionallySizedBox(
              widthFactor: 0.9,
              child: Text("Detected On : 22:55 , 21 Jun 2022", textScaleFactor: 1, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey.shade400),)
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
}
