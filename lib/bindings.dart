import 'package:get/get.dart';
import 'package:oms/controller/adjust_price_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() async {
    Get.put(AdjustPriceController());
  }
}
