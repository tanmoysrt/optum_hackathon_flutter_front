import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../domain/controller/authController.dart';
import '../../presentation/components/button.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.87;
    double buttonHeight = MediaQuery.of(context).size.height * 0.06;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(builder: (context, constraint) {
          return GetX<AuthController>(builder: (controller){
              return Container(
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                  color: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            const Text(
                              "Hi , Welcome",
                              style: TextStyle(fontSize: 30),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Please fill in the following details",
                              style: TextStyle(
                                  fontSize: 18, color: Colors.grey[600]),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Email
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    width: buttonWidth,
                                    height: buttonHeight,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1E1E1E),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(2))),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: TextField(
                                        controller: controller.emailController,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Rounded'),
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: const Color(0xff848484),
                                        decoration: const InputDecoration(
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
                                  height: screenHeight * 0.015,
                                ),
                                //PHone No
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    width: buttonWidth,
                                    height: buttonHeight,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1E1E1E),
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(2))),
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: TextField(
                                        controller: controller.phoneNoController,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Rounded'),
                                        keyboardType: TextInputType.number,
                                        cursorColor: const Color(0xff848484),
                                        decoration: const InputDecoration(
                                          hintText: 'Phone No',
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
                                  height: screenHeight * 0.015,
                                ),
                                //Password
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    width: buttonWidth,
                                    height: buttonHeight,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1E1E1E),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(2))),
                                    child: Padding(
                                      padding:const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: TextField(
                                        controller: controller.passwordController,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Rounded'),
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: const Color(0xff848484),
                                        decoration: const InputDecoration(
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
                                  height: screenHeight * 0.015,
                                ),
                                //Name
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    width: buttonWidth,
                                    height: buttonHeight,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1E1E1E),
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(2))),
                                    child:  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: TextField(
                                        controller: controller.nameController,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Rounded'),
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: const Color(0xff848484),
                                        decoration: const InputDecoration(
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
                                  height: screenHeight * 0.015,
                                ),
                                //Age and Gender
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //Age
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        width: buttonWidth * 0.48,
                                        height: buttonHeight,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1E1E1E),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                          child: TextField(
                                            controller: controller.ageController,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Rounded'),
                                            keyboardType: TextInputType.number,
                                            cursorColor: const Color(0xff848484),
                                            decoration: const InputDecoration(
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
                                      width: screenWidth * 0.0368,
                                    ),
                                    //Gender
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 0),
                                      child: Container(
                                        width: buttonWidth * 0.48,
                                        height: buttonHeight,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1E1E1E),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: TextField(
                                            controller: controller.genderController,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Rounded'),
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            cursorColor:const Color(0xff848484),
                                            decoration: const InputDecoration(
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
                                  height: screenHeight * 0.015,
                                ),
                                //Height and Weight
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //height
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        width: buttonWidth * 0.48,
                                        height: buttonHeight,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1E1E1E),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: TextField(
                                            controller: controller.heightController,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Rounded'),
                                            keyboardType: TextInputType.number,
                                            cursorColor: const Color(0xff848484),
                                            decoration: const InputDecoration(
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
                                      width: screenWidth * 0.0368,
                                    ),
                                    //Weight
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 0),
                                      child: Container(
                                        width: buttonWidth * 0.48,
                                        height: buttonHeight,
                                        decoration: const BoxDecoration(
                                            color: Color(0xff1E1E1E),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: TextField(
                                            controller: controller.weightController,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontFamily: 'Rounded'),
                                            keyboardType: const  TextInputType.numberWithOptions(),
                                            cursorColor: const Color(0xff848484),
                                            decoration: const InputDecoration(
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
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: screenHeight * 0.015,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Container(
                                    width: buttonWidth,
                                    height: buttonHeight,
                                    decoration: const BoxDecoration(
                                        color: Color(0xff1E1E1E),
                                        borderRadius: BorderRadius.all(Radius.circular(2))),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                      child: TextField(
                                        controller: controller.bloodGroupController,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Rounded'),
                                        keyboardType: TextInputType.emailAddress,
                                        cursorColor: const Color(0xff848484),
                                        decoration: const InputDecoration(
                                          hintText: 'Blood Group',
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
                        
                              ],
                            ),
                            const Spacer(),
                            // Container(height: MediaQuery.of(context).size.height*0.1,),
                            controller.isRequesting.value
                                ? Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircularProgressIndicator(
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                )
                                : StyledButton(
                                    textInside: "Let's go",
                                    onPressed: () {
                                      controller.submitRegistration();
                                    },
                                  ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            }
          );
        }),
      ),
    );
  }
}
