import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class horizontalCard extends StatelessWidget {

  String vitalName;
  String vitalUnits;
  String vitalValue;

  horizontalCard({required this.vitalName,required this.vitalUnits,required this.vitalValue});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(left: 15.0,right: 15.0,bottom: 7.5,top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: Color(0xff0D0D0D),
        ),
        height: screenHeight*0.16,

        child: Padding(
          padding: const EdgeInsets.fromLTRB(35.0, 17.5, 20.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(vitalName,style: TextStyle(fontFamily: 'Rounded',color: Colors.grey[600]),),
              SizedBox(
                height:(screenHeight*0.01) ,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children:  [
                  Text( vitalValue,style: const TextStyle(fontSize: 64,color: Colors.white,fontFamily: 'Rounded'),),
                  SizedBox(width: 5,),
                  Text(vitalUnits,style: TextStyle(fontSize: 16,color: Colors.red,fontFamily: 'Rounded'),),
                ],

              )
            ],
          ),
        ),

      ),
    );
  }
}
