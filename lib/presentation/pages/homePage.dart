
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

    return GetBuilder<GlobalController>(
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
                    controller.detectionHistories.isEmpty
                        ? const SizedBox()
                        : AlertCard(
                            detectionHistory: controller.detectionHistories.first,
                            onClickResolve: ()=>controller.markDetectionHistoryAsResolved(controller.detectionHistories.first.id),
                          ),
                    SizedBox(height: calculatedSpacing+1,),
                    // Show heart rate
                    VitalDataHorizontalCard(vitalName: 'Heart Rate', vitalUnits: 'bpm', vitalValue: controller.getVitalValue("hr"), svgImage: "assets/images/heart_rate.svg",),
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
                            value: controller.getVitalValue("spo2"),
                            units: "%",
                            subTitle: "Avg SpO2",
                          ),
                        ),
                        VitalInfoMiniCard(
                          name: "Temperature",
                          value: controller.getVitalValue("temperature"),
                          units: "°F",
                          subTitle: "Body Temperature",
                        ),
                        VitalInfoMiniCard(
                          name: "Steps",
                          value: controller.getVitalValue("steps_walked"),
                          units: "",
                          subTitle: "Total Steps",
                        ),
                        VitalInfoMiniCard(
                          name: "Calorie",
                          value: controller.getVitalValue("calorie"),
                          units: "cal",
                          unitsColor: Colors.amber,
                          subTitle: "Total Calories Burnt",
                        ),
                        ...controller.vitalsInfo.where((p0) => p0.code != "hr" && p0.code != "spo2"  && p0.code != "temperature"  && p0.code != "steps_walked"  && p0.code != "calorie").map((element){
                          return
                          VitalInfoMiniCard(
                            name: element.name,
                            value: controller.getVitalValue(element.code),
                            units: element.unit,
                            subTitle: "Latest ${element.name}",
                          );
                        }).toList()
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

