import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/menu_model/menu_list_model.dart';


class MenusController{

  //get menus
  static Future<MenuListModel> getMenuList()async{
    SharedPreferences _pref = await SharedPreferences.getInstance();
    var restaurantId = _pref.getString("restaurant_id");
    var locationId = _pref.getString("location_id");

    print("dafdsf ==== ${AppConfig.MENU_LIST+"?restaurant=$restaurantId&location=$locationId"}");
    var response = await Api.getApi(url: "https://api.chatchefs.com/api/food/v2/menu?restaurant=22&location=55");
    print("menu response ==== ${response.statusCode}");
    print("menu response ==== ${response.body}");
    return MenuListModel.fromJson(jsonDecode(response.body));
  }

}