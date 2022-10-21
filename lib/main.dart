import 'package:flutter/material.dart';
import 'package:optum_hackathon/Pages/homePage.dart';
import 'package:optum_hackathon/Pages/insightsPage.dart';
import 'package:optum_hackathon/Pages/personalMonitoringPage.dart';
import 'package:optum_hackathon/Pages/toolsPage.dart';

import 'Pages/navPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Rounded',
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
      ),
      home: NavPage(),
    );
  }
}

