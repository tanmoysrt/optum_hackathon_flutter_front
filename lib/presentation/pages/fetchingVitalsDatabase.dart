import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/controller/globalController.dart';

class FetchingVitalsDatabasePage extends StatefulWidget {
  const FetchingVitalsDatabasePage({super.key});

  @override
  State<FetchingVitalsDatabasePage> createState() => _FetchingVitalsDatabasePageState();
}

class _FetchingVitalsDatabasePageState extends State<FetchingVitalsDatabasePage> {

  @override
  void initState() {
    Get.put(GlobalController(), permanent: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo.svg"),
            const SizedBox(
              height: 80,
            ),
            const Text(
              "Fetching Vitals Database",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FractionallySizedBox(
                widthFactor: 0.6,
                child: LinearProgressIndicator(
                  color: Colors.white.withOpacity(0.9),
                  backgroundColor: Colors.white.withOpacity(0.1),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
