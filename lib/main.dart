import 'package:flutter/material.dart';
import 'package:optum_hackathon/Pages/home.dart';
import 'package:optum_hackathon/Pages/insights.dart';
import 'package:optum_hackathon/Pages/menu.dart';
import 'package:optum_hackathon/Pages/personalized.dart';

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
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex=0;
  final screens = [
    HomePage(),
    PersonalizedPage(),
    MenuPage(),
    InsightPage(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hii Snehanjan',
            style: TextStyle(fontSize: 36),
          ),
          backgroundColor: Colors.black,
        ),
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
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded,), label: ' ',backgroundColor: Colors.red),
            BottomNavigationBarItem(
                icon: Icon(Icons.show_chart), label: ' ',backgroundColor: Colors.black87),
            BottomNavigationBarItem(
                icon: Icon(Icons.medical_information_rounded),
                label: ' ',backgroundColor: Colors.black87),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu_rounded), label: ' ',backgroundColor: Colors.black87)
          ],
        ),
      );
}
