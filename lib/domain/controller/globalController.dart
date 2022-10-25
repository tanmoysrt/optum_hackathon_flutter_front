import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:optum_hackathon/domain/controller/authController.dart';
import 'package:optum_hackathon/domain/models/emergencyContacts.dart';
import 'package:optum_hackathon/domain/models/insightsData.dart';
import 'package:optum_hackathon/domain/models/personalizedMonitoring.dart';
import 'package:optum_hackathon/presentation/components/button.dart';
import 'package:optum_hackathon/presentation/pages/navPage.dart';
import 'package:optum_hackathon/presentation/pages/splashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/detectionHistory.dart';
import '../models/vitalsInfo.dart';
import '../services/restApi.dart';

class GlobalController extends GetxController {
  final RestApi _restAPI = RestApi();
  late SharedPreferences _prefs;

  RxString name = "".obs;
  RxList<VitalInfo> vitalsInfo = RxList.empty();
  RxList<DetectionHistory> detectionHistories = RxList.empty();
  RxList<PersonalizedMonitoringRecord> personalizedMonitoringRecords = RxList
      .empty();
  Map<String, VitalData> latestVitals = {};

  RxList<VitalInsight> insights = RxList.empty();
  RxList<EmergencyContact> emergencyContacts = RxList.empty();

  RxBool loadingPersonalizedRecords = false.obs;
  RxBool loadingVitalsInsightsData = false.obs;
  RxBool loadingEmergencyContactsData = false.obs;
  RxBool sendingSOS = false.obs;

  // Textedit Controller for the addition of emergency contact
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


  GlobalController() {
    init()
        .then((_) =>
    {
      readNameFromStorage(),
      fetchVitalsInfo(),
      fetchDetectionHistories(),
      fetchLatestVitalData()
    })
        .then((value) =>
    {
      Timer.periodic(
          const Duration(seconds: 50), (Timer t) => fetchLatestVitalData()),
      Timer.periodic(
          const Duration(seconds: 100), (Timer t) => fetchDetectionHistories())
    })
        .then((value) =>
    {
      fetchEmergencyContact(),
    });
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> readNameFromStorage() async {
    if (_prefs.containsKey("name")) {
      name.value = _prefs.getString("name") ?? "";
    }
  }

  Future<void> fetchVitalsInfo() async {
    var response = await _restAPI.get("/patient/vitals/fetch/info", {});
    if (response.success) {
      vitalsInfo.clear();
      vitalsInfo.addAll((response.payload as List)
          .map((e) => VitalInfo.fromJson(e))
          .toList());
      Get.offAll(() => const NavPage());
    } else {
      Get.snackbar("Failed to load vitals db", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
  }

  Future<void> fetchDetectionHistories() async {
    var response = await _restAPI.get("/patient/detection/history", {});
    if (response.success) {
      detectionHistories.clear();
      detectionHistories.addAll((response.payload as List)
          .map((e) => DetectionHistory.fromJson(e))
          .toList());
      update();
    } else {
      Get.snackbar("Failed to load detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
  }

  Future<void> markDetectionHistoryAsResolved(String id) async {
    var response = await _restAPI.post("/patient/detection/resolved", {}, {
      "id": id
    });
    if (response.success) {
      DetectionHistory? histoy = detectionHistories.firstWhereOrNull((
          element) => element.id == id);
      if (histoy != null) {
        histoy.resolved = true;
        update();
      }
    } else {
      Get.snackbar("Failed to resolve detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
  }

  Future<void> fetchLatestVitalData() async {
    var response = await _restAPI.get("/patient/vitals/fetch/latest", {},);
    if (response.success) {
      latestVitals = (response.payload as Map).map((key, value) =>
          MapEntry(key, VitalData.fromJson(value)));
      update();
    } else {
      Get.snackbar("Failed to resolve detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
  }

  String getVitalValue(String vitalCode) {
    if (latestVitals.containsKey(vitalCode)) {
      int value = latestVitals[vitalCode]!.val;
      if (value == -1) {
        return "-";
      }
      if (value >= 1000) {
        return "${(value / 1000).toStringAsFixed(0)}k";
      } else {
        return value.toStringAsFixed(0);
      }
    } else {
      return "--";
    }
  }

  Future<void> fetchPersonalizedMonitoringRecords() async {
    loadingPersonalizedRecords.value = true;
    var response = await _restAPI.get("/patient/monitoring/records/all", {});
    if (response.success) {
      personalizedMonitoringRecords.clear();
      personalizedMonitoringRecords.addAll((response.payload as List).map((e) =>
          PersonalizedMonitoringRecord.fromJson(e)).toList());
      update();
    } else {
      Get.snackbar("Failed to load detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
    loadingPersonalizedRecords.value = false;
  }

  Future<void> fetchOldVitalsRecords(String vitalCode) async {
    loadingVitalsInsightsData.value = true;
    var response = await _restAPI.get(
        "/patient/vitals/fetch/data/old/$vitalCode", {
      "p": "200"
    });
    if (response.success) {
      insights.clear();
      insights.addAll((response.payload as List)
          .map((e) => VitalInsight.fromJson(e))
          .toList());
      update();
    } else {
      Get.snackbar("Failed to load detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
    loadingVitalsInsightsData.value = false;
  }

  Future<void> fetchEmergencyContact() async {
    loadingEmergencyContactsData.value = true;
    var response = await _restAPI.get("/patient/manage/contact", {});
    if (response.success) {
      emergencyContacts.clear();
      emergencyContacts.addAll((response.payload as List)
          .map((e) => EmergencyContact.fromJson(e))
          .toList());
    } else {
      Get.snackbar("Failed to load detection history", "Restart app",
          backgroundColor: Colors.redAccent.shade400);
    }
    loadingEmergencyContactsData.value = false;
  }

  Future<void> addEmergencyContact() async {
    if (nameController.text.isEmpty || emailController.text.isEmpty ||
        phoneController.text.isEmpty) {
      Get.snackbar("Failed to add emergency contact", "All fields are required",
          backgroundColor: Colors.redAccent.shade400);
      return;
    }
    loadingEmergencyContactsData.value = true;
    Get.showSnackbar(GetSnackBar(
      title: "Adding emergency contact",
      message: "Please wait...",
      backgroundColor: Colors.blueAccent.shade400,
      showProgressIndicator: true,
      duration: const Duration(seconds: 2),
    ));
    var response = await _restAPI.post("/patient/manage/contact", {}, {
      "name": nameController.text,
      "phone": phoneController.text,
      "email": emailController.text
    });
    if (response.success) {
      emergencyContacts.add(EmergencyContact.fromJson(response.payload));
      nameController.clear();
      phoneController.clear();
      emailController.clear();
    } else {
      Get.snackbar("Failed to add emergency contact", "Retry",
          backgroundColor: Colors.redAccent.shade400);
    }
    loadingEmergencyContactsData.value = false;
  }

  Future<void> deleteEmergencyContact(String id) async {
    loadingEmergencyContactsData.value = true;
    var response = await _restAPI.delete("/patient/manage/contact/$id", {});
    if (response.success) {
      emergencyContacts.removeWhere((element) => element.id == id);
      Get.snackbar("Contact deleted successfully",
          "He will not receive any further alerts");
    } else {
      Get.snackbar("Failed to delete emergency contact", "Retry",
          backgroundColor: Colors.redAccent.shade400);
    }
    loadingEmergencyContactsData.value = false;
  }

  Future<void> showFormForAddNewContact() async {
    Get.bottomSheet(
        Container(
          width: double.infinity,
          color: Colors.black,
          // height: 300,
          padding: EdgeInsets.fromLTRB(20, 30, 20, MediaQuery.of(Get.context!).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff1E1E1E),
                        borderRadius:
                        BorderRadius.all(Radius.circular(2))),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: nameController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Rounded'),
                        keyboardType: TextInputType.text,
                        cursorColor: const Color(0xff848484),
                        decoration: const InputDecoration(
                          hintText: 'Name',
                          hintStyle: TextStyle(
                              color: Color(0xff848484),
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Rounded'),
                          border: InputBorder.none,
                          focusColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff1E1E1E),
                        borderRadius:
                        BorderRadius.all(Radius.circular(2))),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: phoneController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Rounded'),
                        keyboardType: TextInputType.number,
                        cursorColor: const Color(0xff848484),
                        decoration: const InputDecoration(
                          hintText: 'Phone No',
                          hintStyle: TextStyle(
                              color: Color(0xff848484),
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Rounded'),
                          border: InputBorder.none,
                          focusColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff1E1E1E),
                        borderRadius:
                        BorderRadius.all(Radius.circular(2))),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: emailController,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Rounded'),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: const Color(0xff848484),
                        decoration: const InputDecoration(
                          hintText: 'E-mail Id',
                          hintStyle: TextStyle(
                              color: Color(0xff848484),
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Rounded'),
                          border: InputBorder.none,
                          focusColor: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                StyledButton(textInside: "Add Contact", onPressed: () {
                  Get.back();
                  addEmergencyContact();
                })
              ],
            ),
          ),
        ),
        isDismissible: false,
    );
  }

  Future<void> sendSOS()async{
    sendingSOS.value = true;
    var response = await _restAPI.get("/patient/manage/contact/sos", {});
    if(response.success){
      Get.snackbar("SOS sent successfully", "Your emergency contacts will be notified");
    }else{
      Get.snackbar("Failed to send SOS", "Retry", backgroundColor: Colors.redAccent.shade400);
    }
    sendingSOS.value = false;
  }

  Future<void> logout()async{
    await _prefs.clear();
    await Get.offAll(() => const SplashPage());
  }
}