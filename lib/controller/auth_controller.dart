import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/app_config.dart';
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




}