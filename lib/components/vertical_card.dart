import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class verticalCard extends StatelessWidget {
  String vitalName;
  String currentMeasurement;
  String requiredMeasuremet;
  String unitsMeasured;
  String unitsToMeasure;
  String statementToMotivate;

  verticalCard(
      {required this.vitalName,
      required this.currentMeasurement,
      required this.requiredMeasuremet,
      required this.unitsMeasured,
      required this.unitsToMeasure,
      required this.statementToMotivate});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xff111111),
        ),
        height: screenHeight * 0.4,
        width: screenWidth * 0.41,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                vitalName,
                style:
                    TextStyle(fontFamily: 'Rounded', color: Colors.grey[600]),
              ),
              SizedBox(
                height: (screenHeight * 0.01),
              ),
              Text(
                currentMeasurement,
                style: TextStyle(
                    fontSize: 48, color: Colors.white, fontFamily: 'Rounded'),
              ),
              SizedBox(
                height: (screenHeight * 0.003),
              ),
              Text(
                unitsMeasured,
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Rounded'),
              ),

              //place for the graph
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  height: screenHeight*0.11,
                  width: screenWidth*0.15,
                  child: PieChart(
                    PieChartData(
                      startDegreeOffset: 180,
                      borderData: FlBorderData(show: false),
                      sectionsSpace: 2,
                      centerSpaceRadius: 15,
                      sections: theSections()
                    ),
                  ),
                ),
              ),

              Text(
                requiredMeasuremet,
                style: TextStyle(
                    fontSize: 36, color: Colors.white, fontFamily: 'Rounded'),
              ),
              Text(
                unitsToMeasure,
                style: TextStyle(
                    fontSize: 16, color: Colors.white, fontFamily: 'Rounded'),
              ),
              SizedBox(
                height: (screenHeight * 0.005),
              ),
              Text(
                statementToMotivate,
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xffA0A0A0),
                    fontFamily: 'Rounded'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> theSections(){
  return List.generate(2, (index) => PieChartSectionData(
      color: Colors.blue,
      value: 25,
      title: '',
      radius: 20,
      titleStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xff90672d),
      ),


  ));
}
