import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrepareTimeController extends GetxController {
  final SharedPreferences _preferences;
  PrepareTimeController({
    required SharedPreferences preferences,
  }) : _preferences = preferences;

  setOrderAcceptTime(int id) {
    _preferences.setString("timer$id", DateTime.now().toIso8601String());
  }

  setOrderPrepTime(int id, int minutes) {
    _preferences.setInt("prep$id", minutes);
  }

  DateTime getOrderAcceptTime(int id) {
    final timeString = _preferences.getString("timer$id");
    if (timeString == null) {
      return DateTime.now();
    }

    return DateTime.parse(timeString);
  }

  int getOrderPrepTime(int id) {
    final minute = _preferences.getInt("prep$id");
    return minute ?? 20;
  }
}
