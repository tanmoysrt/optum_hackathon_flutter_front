
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optum_hackathon/domain/controller/globalController.dart';
import 'package:optum_hackathon/presentation/components/alertCard.dart';
import 'package:optum_hackathon/presentation/pages/insightsPage.dart';

import '../components/vital_data_horizontal_card.dart';
import '../components/vital_info_mini_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// have to use this container with inkwell to insert button functions
  @override
  Widget build(BuildContext context) {
    // width - 0.42%*2 - 40px
    double calculatedSpacing = max(MediaQuery.of(context).size.width*(1-0.42*2)-40, 0.0);

    return GetX<GlobalController>(
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.black,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text(
                      'Hii ${controller.name.value}',
                      style: const TextStyle(color: Colors.white),
                      textScaleFactor: 2.5,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'This is your Dashboard get a quick insight of your vitals here',
                      style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18),
                    ),
                    SizedBox(height: calculatedSpacing+1),
                    AlertCard(),
                    SizedBox(height: calculatedSpacing+1,),
                    // Show heart rate
                    const VitalDataHorizontalCard(vitalName: 'Heart Rate', vitalUnits: 'bpm', vitalValue: '95', svgImage: "assets/images/heart_rate.svg",),
                    SizedBox(height: calculatedSpacing,),
                    // Show steps
    
                    Wrap(
                      spacing: calculatedSpacing,
                      runSpacing: calculatedSpacing,
                      children: [
                        // spo2
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InsightsPage()));
                          },
                          child: VitalInfoMiniCard(
                            name: "SpO2",
                            value: "97",
                            units: "%",
                            subTitle: "Avg SpO2",
                          ),
                        ),
                        VitalInfoMiniCard(
                          name: "Temperature",
                          value: "98",
                          units: "°F",
                          subTitle: "Body Temperature",
                        ),
                        VitalInfoMiniCard(
                          name: "Steps",
                          value: "2.5k",
                          units: "",
                          subTitle: "Total Steps",
                        ),
                        VitalInfoMiniCard(
                          name: "Calorie",
                          value: "15",
                          units: "kcal",
                          unitsColor: Colors.amber,
                          subTitle: "Total Clories Burnt",
                        ),
                      ],
                    ),
                    //Steps vertical card
                    // verticalCard(
                    //     vitalName: 'Steps',
                    //     currentMeasurement: '1263',
                    //     requiredMeasuremet: '8625',
                    //     unitsMeasured: 'steps',
                    //     unitsToMeasure: 'steps',
                    //     statementToMotivate: 'more to go'),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}
