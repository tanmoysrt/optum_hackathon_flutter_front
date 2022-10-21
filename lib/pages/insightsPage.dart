import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/dynamic_icons.dart';

class InsightsPage extends StatefulWidget {
  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  late TrackballBehavior  _trackballBehavior;

  @override
  void initState(){
    _trackballBehavior = TrackballBehavior(enable: true);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: Colors.black,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 10),
            const Text(
              'Hii Snehanjan',
              style: TextStyle(color: Colors.white),
              textScaleFactor: 2.5,
            ),
            const SizedBox(height: 5),
            Text(
              'Here is your health stat',
              style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            const SizedBox(height: 50),
            // _sampleWidget(context)
            SfCartesianChart(
                // Initialize category axis
                trackballBehavior: _trackballBehavior,
                primaryXAxis: CategoryAxis(),
                series: <LineSeries<Pair, String>>[
                  LineSeries<Pair, String>(
                      // Bind data source
                      dataSource: <Pair>[
                        Pair(1, 15),
                        Pair(2, 7),
                        Pair(3, 20),
                        Pair(4, 30),
                        Pair(5, 35),
                        Pair(7, 20),
                        Pair(8, 50),
                        Pair(9, 52),
                        Pair(10, 53),
                        Pair(11, 55),
                        Pair(12, 56),
                        Pair(13, 45),
                        Pair(14, 40),
                        Pair(15, 15),
                        Pair(16, 7),
                        Pair(17, 20),
                        Pair(18, 30),
                        Pair(19, 35),
                        Pair(20, 20),
                        Pair(21, 50),
                        Pair(22, 52),
                        Pair(23, 53),
                        Pair(24, 55),
                        Pair(25, 56),
                        Pair(26, 45),
                        Pair(27, 40),
                      ],
                      enableTooltip: true,
                      xValueMapper: (Pair tmp, _) => tmp.x.toString(),
                      yValueMapper: (Pair tmp, _) => tmp.y,
                      dataLabelSettings: const DataLabelSettings(isVisible: true))
                ])
          ])),
    ));
  }
}

class Pair {
  int x;
  int y;

  Pair(this.x, this.y);
}

Widget _sampleWidget(BuildContext context) {
  return SfCartesianChart(
      // Initialize category axis

      primaryXAxis: CategoryAxis(),
      series: <LineSeries<Pair, String>>[
        LineSeries<Pair, String>(
            // Bind data source
            dataSource: <Pair>[
              Pair(1, 15),
              Pair(2, 7),
              Pair(3, 20),
              Pair(4, 30),
              Pair(5, 35),
              Pair(7, 20),
              Pair(8, 50),
              Pair(9, 52),
              Pair(10, 53),
              Pair(11, 55),
              Pair(12, 56),
              Pair(13, 45),
              Pair(14, 40),
              Pair(15, 15),
              Pair(16, 7),
              Pair(17, 20),
              Pair(18, 30),
              Pair(19, 35),
              Pair(20, 20),
              Pair(21, 50),
              Pair(22, 52),
              Pair(23, 53),
              Pair(24, 55),
              Pair(25, 56),
              Pair(26, 45),
              Pair(27, 40),
            ],
            enableTooltip: true,
            xValueMapper: (Pair tmp, _) => tmp.x.toString(),
            yValueMapper: (Pair tmp, _) => tmp.y,
            dataLabelSettings: DataLabelSettings(isVisible: true))
      ]);
}
