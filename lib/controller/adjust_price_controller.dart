import 'package:get/get.dart';

class AdjustPriceController extends GetxController {
  double adjustedPrice = 0;
  increaseAdjustedPrice() {
    adjustedPrice++;
    update();
  }

  decreaseAdjustedPrice() {
    adjustedPrice--;
    update();
  }

  setAdjustedPrice(double value) {
    adjustedPrice = value;
    update();
  }

  double finalAdjustedPrice = 0;
  setFinalAdjustedPrice() {
    finalAdjustedPrice = adjustedPrice;
    update();
  }

  String reason = "";
  setReason(String? value) {
    reason = value ?? "";
  }
}
