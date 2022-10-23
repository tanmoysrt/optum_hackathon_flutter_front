import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import '../../domain/controller/globalController.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GlobalController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Manage Profile'),
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text("Name", style: TextStyle(color: Colors.white),),
                    subtitle: Text(controller.name.value, style: TextStyle(color: Colors.white.withOpacity(0.8)),),
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
