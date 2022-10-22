import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:optum_hackathon/presentation/components/button.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/dynamic_icons.dart';

class InsightsPage extends StatefulWidget {
  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior =  TooltipBehavior(enable: true);

    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: SfCartesianChart(
                        title: ChartTitle(text: 'SpO2 Levels'),
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: NumericAxis(
                            majorGridLines: const MajorGridLines(width: 0),
                            interval: 1
                        ),
                        primaryYAxis: NumericAxis(
                          interval: 10,
                          majorTickLines: const MajorTickLines(size: 0),
                        ),
                        series: <SplineSeries<Pair, int>>[
                          SplineSeries<Pair, int>(
                            splineType: SplineType.cardinal,
                            cardinalSplineTension: 0.9,
                            dataSource: <Pair>[
                              Pair(1, 15),
                              Pair(2, 7),
                              Pair(3, 20),
                              Pair(4, 30),
                              Pair(5, 35),
                              Pair(7, 20),
                              Pair(8, 50),
                              Pair(9, 52),
                              Pair(10, 53)
                            ],
                            enableTooltip: true,
                            width: 3,
                            xValueMapper: (Pair tmp, _) => tmp.x,
                            yValueMapper: (Pair tmp, _) => tmp.y,
                          )
                        ]
                    )
                ),
        ),
              Positioned(
                top: 0,
                right: 10,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const[
                        Icon(Icons.arrow_back, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Back", style: TextStyle(color: Colors.black),),
                      ],
                    )),
              )
            ],
          )
      ),
    );
  }
}

class Pair {
  int x;
  int y;

  Pair(this.x, this.y);
}
