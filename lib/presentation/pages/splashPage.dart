import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../domain/controller/authController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(AuthController(), permanent: true);

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
