import 'package:flutter/material.dart';
import 'package:optum_hackathon/Pages/login.dart';
import 'package:optum_hackathon/components/vertical_card.dart';

class HomePage extends StatelessWidget {
// have to use thsi container with inkwell to insert button functions
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .width;
    double screenWidth = MediaQuery
        .of(context)
        .size
        .height;

    return Scaffold(
      body: Center(
        child: LoginPage(),
      ),

    );
  }}
