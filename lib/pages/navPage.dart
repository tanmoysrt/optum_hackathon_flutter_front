import 'package:flutter/material.dart';

import 'personalMonitoringPage.dart';
import 'toolsPage.dart';
import 'homePage.dart';
import 'insightsPage.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  NavPageState createState() => NavPageState();
}

class NavPageState extends State<NavPage> {
  int currentIndex=0;
  final screens = [
    HomePage(),
    InsightsPage(),
    PersonalMonitoringPage(),
    MenuPage(),
  ];
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black87,
        currentIndex: currentIndex,
        onTap: (index)=>setState(() {
          currentIndex=index;
        }),
        iconSize: 27,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey.withOpacity(0.4),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded,), backgroundColor: Colors.red, label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), backgroundColor: Colors.black87, label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.medical_information_rounded), backgroundColor: Colors.black87, label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu_rounded), backgroundColor: Colors.black87, label: "")
        ],
      ),
    ),
  );
}
