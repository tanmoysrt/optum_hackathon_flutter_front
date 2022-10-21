import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/button.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery
        .of(context)
        .size
        .width * 0.87;
    double buttonHeight = MediaQuery
        .of(context)
        .size
        .height * 0.06;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Appname and logo to be inserted
            Padding(
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
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
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
            SizedBox(
              height: screenHeight*0.01,
            ),
            Padding(
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
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Color(0xff848484),
                    decoration: InputDecoration(
                      hintText: 'Password',
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
            SizedBox(
              height: screenHeight*0.011,
            ),

            Padding(
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
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: Color(0xff848484),
                    decoration: InputDecoration(
                      hintText: 'Confirm password',
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
            SizedBox(
              height: screenHeight*0.02,
            ),
            buttonMulti(textInside: 'Register Now')
          ],
        )
    );
  }
}
