
import 'package:flutter/material.dart';

class PersonalizedPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
            "This is the personalized page",
            style:
            TextStyle(fontFamily: 'Rounded', fontSize: 60, color: Colors.white),
          )),
    );
  }
}