import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
            "This is the home page",
            style:
            TextStyle(fontFamily: 'Rounded', fontSize: 60, color: Colors.white),
          )),
    );
  }
}