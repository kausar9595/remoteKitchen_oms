import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oms/view/auth/check_atuh.dart';
import 'package:oms/view/menus/menus.dart';
import 'package:oms/view/order/screen/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'view/auth/login.dart';

void main() {
  runApp(const MyApp());
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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'OMS',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      home: token == null ? Login() : Orders(),
    );
  }
}
