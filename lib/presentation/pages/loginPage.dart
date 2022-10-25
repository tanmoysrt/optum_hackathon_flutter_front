import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../domain/controller/authController.dart';
import '../../presentation/components/button.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width * 0.87;
    double buttonHeight = MediaQuery.of(context).size.height * 0.06;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetX<AuthController>(builder: (controller) {
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
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Login Now",
                      textScaleFactor: 1.5,
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: controller.emailController!,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: const Color(0xff848484),
                            decoration: const InputDecoration(
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
                      height: screenHeight * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Container(
                        width: buttonWidth,
                        height: buttonHeight,
                        decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: TextField(
                            controller: controller.passwordController!,
                            obscureText: true,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Rounded'),
                            keyboardType: TextInputType.visiblePassword,
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
                      height: screenHeight * 0.02,
                    ),

                    controller.isRequesting.value
                        ? SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          )
                        : StyledButton(
                            textInside: 'Login',
                            onPressed: () {
                              controller.login();
                            },
                          ),
                    const SizedBox(
                      height: 10,
                    ),
                    StyledButton(
                      outlined: true,
                      textInside: 'Register Yourself',
                      onPressed: () {
                        controller.goToRegistrationPage();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(onPressed: (){
                      controller.showForgotPasswordForm();
                    }, child: const Text("Forget password ?"))
                  ],
                ),
              ),
            )),
      );
    });
  }
}
