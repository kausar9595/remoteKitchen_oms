import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/model/auth_model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:oms/view/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthController{

  //------- user login -----------//
  static Future<http.Response> login({required BuildContext context, required String email, required String password})async{

    SharedPreferences _pref = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse(AppConfig.LOGIN),
      body: {
        "email": email,
        "password" : password
      }
    );
    //return response
    return response;
  }


  //logout
  static Future logout(context)async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.remove("token");
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false) ;
  }


  //store device token
  static Future storeDeviceLocation(String token)async{
      var response = await Api.postApi(url: AppConfig.STORE_DEVICE_TOKEN,
          body: {
            "device_id": "",
            "push_token": token,
            "platform": "android"
          }
      );
      if(response.statusCode == 200){
        print("device toekn added---");
      }
  }




}