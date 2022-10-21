
import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/button.dart';
import 'package:optum_hackathon/components/horizontal_card.dart';
import 'package:optum_hackathon/components/vertical_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

// have to use this container with inkwell to insert button functions
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight * 0.075,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Hii Snehanjan',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Rounded', fontSize: 32),
                ),
              ),
              SizedBox(height: screenHeight * 0.0175),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Text(
                  'This is your Dashboard get a quick insight of your vitals here',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Rounded',
                      fontSize: 18),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              horizontalCard(
                  vitalName: 'Heart Rate', vitalUnits: 'bpm', vitalValue: '95'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Steps vertical card
                  verticalCard(
                      vitalName: 'Steps',
                      currentMeasurement: '1263',
                      requiredMeasuremet: '8625',
                      unitsMeasured: 'steps',
                      unitsToMeasure: 'steps',
                      statementToMotivate: 'more to go'),
                  SizedBox(width: screenWidth*0.0075,),
                  //The sleep and spo2
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //sleep
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xff0D0D0D)),
                        height: screenHeight * 0.4,
                        width: screenWidth * 0.205,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Sleep',
                                style: TextStyle(
                                    fontFamily: 'Rounded',
                                    color: Colors.grey[600]),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.01),
                              ),
                              const Text(
                                '9',
                                style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontFamily: 'Rounded'),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.003),
                              ),

                              //place for the graph

                              const Text(
                                'hours',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Rounded'),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.015),
                              ),
                              const Text(
                                'Slept Today',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffA0A0A0),
                                    fontFamily: 'Rounded'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight*0.05,),
                      //spo2
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xff0D0D0D)),
                        height: screenHeight * 0.4,
                        width: screenWidth * 0.205,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'SpO2',
                                style: TextStyle(
                                    fontFamily: 'Rounded',
                                    color: Colors.grey[600]),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.01),
                              ),
                              const Text(
                                '95',
                                style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontFamily: 'Rounded'),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.003),
                              ),

                              //place for the graph

                              const Text(
                                'percent',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontFamily: 'Rounded'),
                              ),
                              SizedBox(
                                height: (screenHeight * 0.02),
                              ),
                              const Text(
                                'Average today',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xffA0A0A0),
                                    fontFamily: 'Rounded'),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Center(
                child: InkWell(
                  onTap: ()=>{},
                  child: buttonMulti(textInside: 'Sync-Now'),

                ),
              ),
              SizedBox(height: screenHeight*0.01,),
              Center(
                child: Text(
                  'Click to SYNC with connected device',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontFamily: 'Rounded',
                      fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
