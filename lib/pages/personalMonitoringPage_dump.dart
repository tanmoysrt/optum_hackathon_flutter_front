import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/vertical_card.dart';
class PersonalMonitoringPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.width;
    double screenWidth = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                SizedBox(
                  height: screenHeight * 0.075,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Snehanjan',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Rounded', fontSize: 32),
                  ),
                ),
                SizedBox(height: screenHeight * 0.0175),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Text(
                    'This is your Personalized Dashboard',
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'Rounded',
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Text(
                    'Monitoring by Dr. LUCIFER',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontFamily: 'Rounded',
                        fontSize: 22),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalCard(vitalName: 'Steps', currentMeasurement: '1236', requiredMeasuremet: '8201', unitsMeasured: 'steps', unitsToMeasure: 'steps', statementToMotivate: 'more to go'),
                    SizedBox(height: screenWidth * 0.1),
                    verticalCard(vitalName: 'Calories', currentMeasurement: '246', requiredMeasuremet: '254', unitsMeasured: 'kcal', unitsToMeasure: 'kcal', statementToMotivate: 'more to burn')
                  ],
                ),SizedBox(height: screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalCard(vitalName: 'Steps', currentMeasurement: '1236', requiredMeasuremet: '8201', unitsMeasured: 'steps', unitsToMeasure: 'steps', statementToMotivate: 'more to go'),
                    SizedBox(height: screenWidth * 0.1),
                    verticalCard(vitalName: 'Calories', currentMeasurement: '246', requiredMeasuremet: '254', unitsMeasured: 'kcal', unitsToMeasure: 'kcal', statementToMotivate: 'more to burn')
                  ],
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
