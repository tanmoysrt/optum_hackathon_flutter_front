import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/controller/globalController.dart';
import '../../domain/models/personalizedMonitoring.dart';

import '../components/dynamic_icons.dart';

class PersonalMonitoringPage extends StatefulWidget {
  const PersonalMonitoringPage({Key? key}) : super(key: key);

  @override
  State<PersonalMonitoringPage> createState() => _PersonalMonitoringPageState();
}

class _PersonalMonitoringPageState extends State<PersonalMonitoringPage> {
  final GlobalController _globalController = Get.find<GlobalController>();

  @override
  void initState() {
    super.initState();
    _globalController.fetchPersonalizedMonitoringRecords();
  }

  @override
  Widget build(BuildContext context) {

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
                            const SizedBox(height: 10),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title:Text(
                                'Hii ${controller.name.value}',
                                style: const TextStyle(color: Colors.white),
                                textScaleFactor: 2,
                              ),
                              subtitle: Text(
                                'Your personalized monitoring records',
                                style: TextStyle(color: Colors.grey[600], fontSize: 18)
                              ),
                              trailing: Obx(() => controller.loadingPersonalizedRecords.value ? CircularProgressIndicator(
                                    color: Colors.green,
                                    backgroundColor: Colors.grey[600],
                                  ) : const SizedBox.shrink()
                              ),
                            ),
                            const SizedBox(height: 50),
                            ...controller.personalizedMonitoringRecords.map((record) => _personalizedMonitoringCard(context, record)).toList()
                          ]
                      )
                  ),
                )
            )
        );
      }
    );
  }
}


Widget _personalizedMonitoringCard(BuildContext context, PersonalizedMonitoringRecord personalizedMonitoringRecord) {
  List<String> vitalsMonitoring = ["Heart Rate", "Steps", "SpO2", "BP"];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(personalizedMonitoringRecord.name,
          style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 22),
        ),
        subtitle: Text('By ${personalizedMonitoringRecord.assigneeType == "doctor" ?  personalizedMonitoringRecord.doctorName : "you"}',
          style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 16),
        )
      ),

      const SizedBox(height: 5,),
      Wrap(
        spacing: 5,
        children: personalizedMonitoringRecord.vitalThreshold.map((e) => Chip(label: Text(e.vital.name), visualDensity: VisualDensity.compact,)).toList(),
      ),
      personalizedMonitoringRecord.isMonitorCalorieCount ? const SizedBox(height: 10,) : const SizedBox.shrink(),
      personalizedMonitoringRecord.isMonitorCalorieCount ? _calorieTargetCard(context, personalizedMonitoringRecord.minCalorieCount, personalizedMonitoringRecord.currentCalories) : const SizedBox.shrink(),
      personalizedMonitoringRecord.isMonitorStepCount ? const SizedBox(height: 10,) : const SizedBox.shrink(),
      personalizedMonitoringRecord.isMonitorStepCount ? _footstepsTargetCard(context, personalizedMonitoringRecord.minStepCount, personalizedMonitoringRecord.currentSteps) : const SizedBox.shrink(),
      const Divider(height: 40,),
    ],
  );
}


Widget _calorieTargetCard(BuildContext context, int target, int done){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
    ),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
    // Layout
    // ----- Row ------
    // Column  |  Column
    // ------  | -------
    // Current |
    // Required| Icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // data
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Current stat
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text(done.toString(),style: const TextStyle(fontSize: 45,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    const Text("cal",style: TextStyle(fontSize: 16,color: Color(0xFFFFB800))),
                  ],
                ),
                // label
                Text("Calories Burnt",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
            // space
            const SizedBox(height: 25,),
            // more required
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text((max(target-done, 0)).toString(),style: const TextStyle(fontSize: 21,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    Text("kcal",style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                  ],
                ),
                // label
                Text("Calories to Be Burnt",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
          ],
        ),
        // Icon
        DynamicIcon(assetImage: "assets/images/walking.png", fillPercentage: done/target, fillColor: const Color(0xFFFFB800), backgroundColor: Colors.transparent, height: 60, width: 50)
      ],
    ),
  );
}


Widget _footstepsTargetCard(BuildContext context, int target, int done){
  return Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
    ),
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
    // Layout
    // ----- Row ------
    // Column  |  Column
    // ------  | -------
    // Current |
    // Required| Icon
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      textBaseline: TextBaseline.alphabetic,
      children: [
        // data
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Current stat
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text(done.toString(),style: const TextStyle(fontSize: 45,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    const Text("steps",style: TextStyle(fontSize: 16,color: Color(0xFF58C5CC))),
                  ],
                ),
                // label
                Text("Steps Walked",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
            // space
            const SizedBox(height: 25,),
            // more required
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Value with unit
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children:  [
                    // value
                    Text((max(target-done,0)).toString(),style: const TextStyle(fontSize: 21,color: Colors.white)),
                    const SizedBox(width: 5,),
                    // unit
                    Text("steps",style: TextStyle(fontSize: 16,color: Colors.grey.shade600)),
                  ],
                ),
                // label
                Text("Need to be completed",style: TextStyle(color: Colors.grey.shade600), textScaleFactor: 1.1,),
              ],
            ),
          ],
        ),
        // Icon
        DynamicIcon(assetImage: "assets/images/footsteps.png", fillPercentage: done/target, fillColor: const Color(0xFF58C5CC), backgroundColor: Colors.transparent, height: 60, width: 50)
      ],
    ),
  );
}