import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/button.dart';

class InitialInfopage extends StatelessWidget {

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
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Name
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
                          hintText: 'Name',
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
                  height: screenHeight*0.015,
                ),
                //Age and Gender
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Age
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth*0.48,
                        height: buttonHeight,
                        decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
                            keyboardType: TextInputType.number,
                            cursorColor: Color(0xff848484),
                            decoration: InputDecoration(
                              hintText: 'Age (in years)',
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
                      width: screenWidth*0.0368,
                    ),
                    //Gender
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth*0.48,
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
                              hintText: 'Gender',
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
                    )

                  ],
                ),
                SizedBox(
                  height: screenHeight*0.015,
                ),
                //Height and Weight
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //height
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth*0.48,
                        height: buttonHeight,
                        decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
                            keyboardType: TextInputType.number,
                            cursorColor: Color(0xff848484),
                            decoration: InputDecoration(
                              hintText: 'Height (in cms)',
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
                      width: screenWidth*0.0368,
                    ),
                    //Weight
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth*0.48,
                        height: buttonHeight,
                        decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            style: TextStyle(
                                color: Colors.white, fontSize: 15, fontFamily: 'Rounded'),
                            keyboardType: TextInputType.numberWithOptions(),
                            cursorColor: Color(0xff848484),
                            decoration: InputDecoration(
                              hintText: 'Weight (in kgs.)',
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
                    )

                  ],
                ),

              ],
            ),
            SizedBox(
              height: screenHeight*0.3,
            ),
            InkWell(
              onTap: ()=>{},
              child: buttonMulti(textInside: 'Next'),
            ),
            SizedBox(
              height: screenHeight*0.05,
            )
          ],
        )
    );
  }
}
