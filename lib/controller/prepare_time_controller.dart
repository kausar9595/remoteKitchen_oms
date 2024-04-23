import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrepareTimeController extends GetxController {
  setOrderAcceptTime(int id) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString("timer${id}", DateTime.now().toIso8601String());
  }

  Future<DateTime> getOrderAcceptTime(int id) async {
    final pref = await SharedPreferences.getInstance();
    final timeString = pref.getString("timer${id}");
    if (timeString == null) {
      return DateTime.now();
    }

    return DateTime.parse(timeString);
  }
}
