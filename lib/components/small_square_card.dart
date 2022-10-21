import 'package:flutter/material.dart';
class squareButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.width ;
    double screenWidth = MediaQuery.of(context).size.height ;
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color(0xff0D0D0D)
      ),
      height: screenHeight * 0.4,
      width: screenWidth * 0.205,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sleep',
              style:
              TextStyle(fontFamily: 'Rounded', color: Colors.grey[600]),
            ),
            SizedBox(
              height: (screenHeight * 0.01),
            ),
            const Text(
              '9',
              style: TextStyle(
                  fontSize: 48, color: Colors.white, fontFamily: 'Rounded'),
            ),
            SizedBox(
              height: (screenHeight * 0.003),
            ),


            //place for the graph



            const Text(
              'hours',
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: 'Rounded'),
            ),
            SizedBox(
              height: (screenHeight * 0.02),
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
    );
  }
}
