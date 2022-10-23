import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../domain/controller/globalController.dart';
import '../../domain/models/insightsData.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class InsightsPage extends StatefulWidget {
  final String vitalCode;
  final String vitalName;

  const InsightsPage(
      {super.key, required this.vitalCode, required this.vitalName});
  @override
  State<InsightsPage> createState() => _InsightsPageState();
}

class _InsightsPageState extends State<InsightsPage> {
  late TooltipBehavior _tooltipBehavior;
  final GlobalController _globalController = Get.find<GlobalController>();
  bool isRotatingInProcess = true;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> init() async {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isRotatingInProcess = false;
    });
    _globalController.fetchOldVitalsRecords(widget.vitalCode);
  }

  Future<bool> _onWillPop() async {
    setState(() {
      isRotatingInProcess = true;
    });
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    await Future.delayed(const Duration(seconds: 2));
    Get.back();
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => await _onWillPop(),
        child: isRotatingInProcess
            ? Scaffold(
              body: Center(
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Rotating Screen...")
                  ],
                )),
            )
            : GetX<GlobalController>(builder: (controller) {
                return SafeArea(
                  child: Scaffold(
                      body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            alignment: Alignment.center,
                            color: Colors.black,
                            child: SfCartesianChart(
                                title: ChartTitle(
                                    text: "${widget.vitalName} data"),
                                tooltipBehavior: _tooltipBehavior,
                                primaryXAxis: DateTimeCategoryAxis(
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    interval: 1),
                                primaryYAxis: NumericAxis(
                                  interval: 5,
                                  majorTickLines: const MajorTickLines(size: 0),
                                ),
                                series: [
                                  SplineSeries(
                                    splineType: SplineType.cardinal,
                                    cardinalSplineTension: 0.9,
                                    dataSource: controller.insights.reversed.toList(),
                                    enableTooltip: true,
                                    width: 3,
                                    xValueMapper: (VitalInsight tmp, _) =>
                                        tmp.toDateTime(),
                                    yValueMapper: (VitalInsight tmp, _) =>
                                        tmp.value,
                                  )
                                ])),
                      ),
                      Positioned(
                        top: 0,
                        right: 10,
                        child: controller.loadingVitalsInsightsData.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  _onWillPop();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.arrow_back,
                                      color: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Back",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                )),
                      )
                    ],
                  )),
                );
              }));
  }
}

