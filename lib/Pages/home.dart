import 'package:flutter/material.dart';
import 'package:optum_hackathon/components/button.dart';
import 'package:optum_hackathon/components/horizontal_card.dart';

class HomePage extends StatelessWidget {

// have to use thsi container with inkwell to insert button functions
  @override
  Widget build(BuildContext context) {
    double buttonWidth = MediaQuery.of(context).size.width*0.87;
    double buttonHeight = MediaQuery.of(context).size.height*0.06;

    return  Scaffold(
      body: Center(
        child: buttonMulti(textInside: 'Sync-Now',)
      ),
    );
  }
}