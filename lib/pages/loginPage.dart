import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:optum_hackathon/components/button.dart';

import 'initialinfoPage.dart';

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
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Appname and logo to be inserted
                SvgPicture.asset("assets/images/logo.svg"),
                const SizedBox(height: 40,),
                Text("Register Now", textScaleFactor: 1.5, style: TextStyle(color: Colors.white.withOpacity(0.7)),),
                const SizedBox(height: 15,),
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
                            color: Colors.white, fontSize: 15),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Color(0xff848484),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(
                              color: Color(0xff848484),
                              fontStyle: FontStyle.italic),
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
                        obscureText: true,
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
                  height: screenHeight*0.02,
                ),
                buttonMulti(textInside: 'Login', onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>InitialInfopage()));
                },),
              ],
            ),
          ),
        )
      ),
    );
  }
}
