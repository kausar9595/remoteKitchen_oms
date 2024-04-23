import 'package:get/get.dart';
import 'package:oms/controller/adjust_price_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/prepare_time_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() async {
    final pref = await SharedPreferences.getInstance();
    Get.put(AdjustPriceController());
    Get.put(PrepareTimeController(preferences: pref));
  }
}
