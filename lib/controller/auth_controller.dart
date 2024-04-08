import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/model/auth_model/login_model.dart';
import 'package:http/http.dart' as http;
import 'package:oms/model/restaurant_model/restaurantListModel.dart';
import 'package:oms/view/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/restaurant_model/location_list_model.dart';


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
    _pref.remove("restaurant_id");
    _pref.remove("restaurant_name");
    _pref.remove("location_name");
    _pref.remove("location_id");
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


  Future<List<LocationResult>> getLocation()async{
    List<LocationResult> _locationList =[];
    var res = await RestaurantController.getLocationList();
    for(var i in res.results!){
      _locationList.add(i);
    }
    return _locationList;
  }


  Future<List<RestaurantResult>?>  getRestaurantList()async{
    List<RestaurantResult> _restaurantList = [];
    var res = await RestaurantController.getRestaurantList();
    for(var i in res.results!){
      _restaurantList.add(i);
    }
    return _restaurantList;
  }




}