import 'package:alarm/service/alarm_storage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:oms/firebase_options.dart';
import 'package:oms/notifications/notification.dart';
import 'package:oms/view/order/screen/new_orders.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'notifications/local_notoification.dart';
import 'view/auth/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
 // notificationAccess();
  LocalNotificationService.initialize();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);

  NotificationController().requestNotificationPermissions();
  checkAndroidScheduleExactAlarmPermission();
  AlarmStorage.init();
  runApp(const MyApp());
}

Future<void> checkAndroidScheduleExactAlarmPermission() async {
  final status = await Permission.scheduleExactAlarm.status;
  print('Schedule exact alarm permission: $status.');
  if (status.isDenied) {
    print('Requesting schedule exact alarm permission...');
    final res = await Permission.scheduleExactAlarm.request();
    print('Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted.');
  }
}

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future notificationAccess()async{
  final _firebaseMesseegin = await FirebaseMessaging.instance;
  await _firebaseMesseegin.requestPermission();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //check auth
  var token;
  getToken()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() => token = _prefs.getString("token"));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();

  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'OMS',
          theme: ThemeData(
            fontFamily: 'Poppins',
            primarySwatch: Colors.blue,
          ),
          //home: token == null ? Login() : NewOrderScreen(),
          home: token == null ? NewOrderScreen() : NewOrderScreen(),

        );
      }
    );
  }
}
