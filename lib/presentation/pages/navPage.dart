import 'package:flutter/material.dart';
import 'package:optum_hackathon/presentation/pages/sosPage.dart';

import 'alertPage.dart';
import 'personalMonitoringPage.dart';
import 'homePage.dart';

class NavPage extends StatefulWidget {
  const NavPage({Key? key}) : super(key: key);

  @override
  NavPageState createState() => NavPageState();
}

class NavPageState extends State<NavPage> {
  @override
  void initState() {
    super.initState();
  }
  int currentIndex=0;
  final screens = const[
    HomePage(),
    PersonalMonitoringPage(),
    AlertPage(),
    SOSPage()
    // ProfilePage(),
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
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded,), backgroundColor: Colors.black87, label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_outlined), backgroundColor: Colors.black87, label: "monitoring"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined), backgroundColor: Colors.black87, label: "alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), backgroundColor: Colors.black87, label: "account"),
          // BottomNavigationBarItem(icon: Icon(Icons.person_outline), backgroundColor: Colors.black87, label: "")
        ],
      ),
    ),
  );
}
