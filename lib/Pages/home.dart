import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
// have to use thsi container with inkwell to insert button functions
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.87;
    double buttonHeight = MediaQuery.of(context).size.height * 0.06;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Container(
            width: buttonWidth,
            height: buttonHeight,
            decoration: const BoxDecoration(
                color: Color(0xff1E1E1E),
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'Rounded'),
                keyboardType: TextInputType.emailAddress,
                cursorColor: Color(0xff848484),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: Color(0xff848484),
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Rounded'),
                  border: InputBorder.none,
                  focusColor: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
