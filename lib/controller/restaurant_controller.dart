import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/model/restaurant_model/restaurantListModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/restaurant_model/location_list_model.dart';

class RestaurantController{

  //get all restaurant
  static Future<RestaurantListModel> getRestaurantList()async{
    var response = await Api.getApi(url: AppConfig.RESTAURANT_LIST);
    print("data === ${response.body}");
    print("data === ${response.statusCode}");
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
  static Future addSelectedRestaurantInfo({required String restaurantId})async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setString("restaurant_id",restaurantId);
  }

}