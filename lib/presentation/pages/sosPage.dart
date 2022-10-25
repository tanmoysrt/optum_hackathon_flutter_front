import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:optum_hackathon/domain/controller/globalController.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<GlobalController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Manage Account"),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  onPressed: (){
                    controller.logout();
                  },
                  icon: Icon(Icons.logout, color: Colors.grey.shade600,)
              )
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AvatarGlow(
                    startDelay: const Duration(milliseconds: 1000),
                    glowColor: Colors.white,
                    endRadius: 150.0,
                    duration: const Duration(milliseconds: 2500),
                    repeat: true,
                    showTwoGlows: true,
                    repeatPauseDuration: const Duration(milliseconds: 100),
                    child: MaterialButton(
                      onPressed: () {
                        controller.sendSOS();
                      },
                      elevation: 20.0,
                      shape: const CircleBorder(),
                      child: Stack(
                        children: [
                          Container(
                            width: 150.0,
                            height: 150.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(120.0)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const[
                                 Text(
                                  "SOS",
                                  style: TextStyle(
                                      fontSize: 45.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.blue),
                                ),
                                Text(
                                  "Tap to send",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: controller.sendingSOS.value,
                            child: const Positioned(
                              top: 0,
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: CircularProgressIndicator(strokeWidth: 6, color: Colors.amber,),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Emergency contact label with add button
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Emergency contacts", textScaleFactor: 1.4,),
                      GestureDetector(
                        onTap: ()=>controller.showFormForAddNewContact(),
                          child: const Chip(label: Text("add contact"))
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // Emergency contacts list
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ListView.builder(
                        itemCount: controller.emergencyContacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              dense: true,
                              leading: IconButton(
                                icon: const Icon(Icons.call, color: Colors.blueAccent,),
                                onPressed: ()async{
                                  await FlutterPhoneDirectCaller.callNumber(controller.emergencyContacts[index].phone);
                                },
                              ),
                              trailing: IconButton(onPressed: (){
                                controller.deleteEmergencyContact(controller.emergencyContacts[index].id);
                              }, icon: const Icon(Icons.delete, color: Colors.redAccent,)),
                              title: Text(controller.emergencyContacts[index].name),
                              subtitle: Text(controller.emergencyContacts[index].email),
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
