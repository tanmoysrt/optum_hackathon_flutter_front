import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "This is the menu page",
        style:
            TextStyle(fontFamily: 'Rounded', fontSize: 60, color: Colors.white),
      )),
    );
  }
}
