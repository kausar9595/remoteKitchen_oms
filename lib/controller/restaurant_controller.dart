import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/model/restaurant_model/restaurantListModel.dart';
import 'package:oms/view/auth/login.dart';
import 'package:oms/widget/app_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/restaurant_model/locationAndRestaurantIds.dart';
import '../model/restaurant_model/location_list_model.dart';

class RestaurantController{

  //get all restaurant
  static Future<RestaurantListModel> getRestaurantList(context)async{
    var response = await Api.getApi(url: AppConfig.RESTAURANT_LIST);
    print("data === ${response.body}");
    print("data === ${response.statusCode}");
    if(response.statusCode == 401){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login() ), (route) => false);
      AppSnackBar(context, "Your login is expire. You need to login again to continue.", Colors.green);
    }
    return RestaurantListModel.fromJson(jsonDecode(response.body));
  }

  //get all restaurant
  static Future<LocationListModel> getLocationList()async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var restaurantId = _prefs.getString("restaurant_id");
    var response = await Api.getApi(url: AppConfig.LOCATION_LIST+restaurantId!);
    return LocationListModel.fromJson(jsonDecode(response.body));
  }


  //add selected restaurant name into local storage
  static Future addSelectedRestaurantInfo({required String restaurantId, required String restaurantName})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("restaurant_id",restaurantId);
    _pref.setString("restaurant_name",restaurantName);
  }
  //add selected restaurant name into local storage
  static Future addSelectedLocationInfo({required String locationId, required String locationName})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("location_id",locationId);
    _pref.setString("location_name",locationName);
  }
  //get restaurant and location id
  static Future<LocationAndRestaurantIds> getLocationAndRestaurantIds()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var data = {
      "location_id" : "${_pref.getString("location_id")}",
      "location_name" : "${_pref.getString("location_name")}",
      "restaurant_id" : "${_pref.getString("restaurant_id")}",
      "restaurant_name" : "${_pref.getString("restaurant_name")}"
    };
    return LocationAndRestaurantIds.fromJson(data);

  }


}