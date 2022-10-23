import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../domain/controller/globalController.dart';
import '../../domain/models/detectionHistory.dart';

import '../components/button.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GlobalController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text("Detection History"),
            automaticallyImplyLeading: false
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: controller.detectionHistories.map((record) => _alertCard(context, record, (id)=>controller.markDetectionHistoryAsResolved(id),)).toList(),
              ),
            ),
          ),
        );
      }
    );
  }
}


Widget _alertCard(BuildContext context, DetectionHistory detectionHistory, Function onClickResolve) {
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
            SvgPicture.asset( "assets/images/${detectionHistory.riskLevel}_risk.svg", width: 80, ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Tooltip(
                  message: detectionHistory.cause,
                  triggerMode: TooltipTriggerMode.tap,
                  child: Row(
                    children: [
                      Text(detectionHistory.disease??"See details", textScaleFactor: 1.5,),
                      const SizedBox(width: 10,),
                      const Icon(Icons.info_outline, color: Colors.blue,size: 18,),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                // TODO Substring .substring(0,34)
                Text("By : ${detectionHistory.reoprtedByName.substring(0, min(detectionHistory.reoprtedByName.length, 30))}", textScaleFactor: 1, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey.shade400),),
                const SizedBox(height: 2,),
                Text("Detected On : ${detectionHistory.toFormattedDateTime()}", textScaleFactor: 1, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey.shade400),),
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
            detectionHistory.resolved ?
              Tooltip(
                  message: "The issue has already resolved",
                  child: StyledButton(textInside: "Resolved !", fractionalWidth: 0.38, fractionalHeight: 0.05, bgColor: Colors.grey.shade800,textSize: 12,))
            : StyledButton(textInside: "Mark as resolved", fractionalWidth: 0.38, fractionalHeight: 0.05, bgColor: const Color(0xFF2E7A00),textSize: 12, onPressed: ()=>onClickResolve(detectionHistory.id),),
            StyledButton(textInside: "Consult Specialist", fractionalWidth: 0.38, fractionalHeight: 0.05, bgColor: const Color(0xFF004A7F), textSize: 12,
              onPressed: ()=>Get.defaultDialog(
                  title: "Consult with doctor",
                  content: const Text("This can be integrated with telemedicine services",  textAlign: TextAlign.center,),
                cancel: TextButton(
                  onPressed: ()=>Get.back(),
                  child: const Text("Cancel"),
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}