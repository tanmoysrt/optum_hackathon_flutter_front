import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:optum_hackathon/presentation/pages/navPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/detectionHistory.dart';
import '../models/vitalsInfo.dart';
import '../services/restApi.dart';

class GlobalController extends GetxController{
  final RestApi _restAPI = RestApi();
  late SharedPreferences _prefs;
  
  RxString name = "".obs;
  RxList<VitalInfo> vitalsInfo = RxList.empty();
  RxList<DetectionHistory> detectionHistories = RxList.empty();

  Map<String, VitalData> latestVitals = {};


  GlobalController(){
    init()
    .then((_) =>{
      readNameFromStorage(),
      fetchVitalsInfo(),
      fetchDetectionHistories(),
      fetchLatestVitalData()
    })
    .then((value) => {
      Timer.periodic(const Duration(seconds: 5), (Timer t) => fetchLatestVitalData()),
      Timer.periodic(const Duration(seconds: 10), (Timer t) => fetchDetectionHistories())
    });
  }

  Future<void> init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> readNameFromStorage()async {
    if(_prefs.containsKey("name")){
      name.value = _prefs.getString("name") ?? "";
    }
  }

  Future<void> fetchVitalsInfo()async{
    var response = await _restAPI.get("/patient/vitals/fetch/info", {});
    if(response.success){
      vitalsInfo.addAll((response.payload as List).map((e) => VitalInfo.fromJson(e)).toList());
      Get.offAll(()=>const NavPage());
    }else{
      Get.snackbar("Failed to load vitals db", "Restart app", backgroundColor: Colors.redAccent.shade400 );
    }
  }

  Future<void> fetchDetectionHistories()async{
    var response = await _restAPI.get("/patient/detection/history", {});
    if(response.success){
      detectionHistories.addAll((response.payload as List).map((e) => DetectionHistory.fromJson(e)).toList());
      update();
    }else{
      Get.snackbar("Failed to load detection history", "Restart app", backgroundColor: Colors.redAccent.shade400 );
    }
  }

  Future<void> markDetectionHistoryAsResolved(String id)async{
    var response = await _restAPI.post("/patient/detection/resolved", {}, {
      "id" : id
    });
    if(response.success){
      detectionHistories.removeWhere((element) => element.id == id);
      update();
    }else{
      Get.snackbar("Failed to resolve detection history", "Restart app", backgroundColor: Colors.redAccent.shade400 );
    }
  }

  Future<void> fetchLatestVitalData()async{
    var response = await _restAPI.get("/patient/vitals/fetch/latest", {}, );
    if(response.success){
      latestVitals = (response.payload as Map).map((key, value) => MapEntry(key, VitalData.fromJson(value)));
      update();
    }else{
      Get.snackbar("Failed to resolve detection history", "Restart app", backgroundColor: Colors.redAccent.shade400 );
    }
  }

  String getVitalValue(String vitalCode){
    if(latestVitals.containsKey(vitalCode)){
      int value = latestVitals[vitalCode]!.val;
      if(value == -1){
        return "-";
      }
      if(value >= 1000)
        return (value/1000).toStringAsFixed(0) + "k";
      else
        return value.toStringAsFixed(0);
    }else{
      return "--";
    }
  }



}