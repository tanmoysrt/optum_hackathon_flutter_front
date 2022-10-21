import 'package:flutter/material.dart';
import 'profile.dart';

import 'alertPage.dart';
import 'personalMonitoringPage.dart';
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
    PersonalMonitoringPage(),
    AlertPage(),
    ProfilePage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined), backgroundColor: Colors.black87, label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined), backgroundColor: Colors.black87, label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), backgroundColor: Colors.black87, label: "")
        ],
      ),
    ),
  );
}
