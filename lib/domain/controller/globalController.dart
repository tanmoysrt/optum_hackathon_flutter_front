import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/restApi.dart';

class GlobalController extends GetxController{
  final RestApi _restAPI = RestApi();
  late SharedPreferences _prefs;
  
  RxString name = "".obs;



  GlobalController(){
    init()
    .then((_) => {
      readNameFromStorage()
    });
  }

  Future<void> init()async{
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> readNameFromStorage()async {
    if(_prefs.containsKey("name")){
      name.value = _prefs.getString("name") ?? "";
    }
    update();
  }


}