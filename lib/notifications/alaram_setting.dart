import 'package:alarm/alarm.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AlarmStorage {
  late SharedPreferences prefs; // Declare prefs as a late variable

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance(); // Initialize prefs
  }

}