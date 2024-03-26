import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';

import '../model/order_model/order_list_model.dart';

class OrderController{

  //get incoming orders (Status: Pending)
  static Future<OrderListModel> getPendingOrder()async{
    var response = await Api.getApi(url: AppConfig.ORDER_LIST+"?restaurant=101&location=56&active_orders=active_orders");
    return OrderListModel.fromJson(jsonDecode(response.body));
  }
  //get Scheduled orders (Status: scheduled_orders)

  //get Complete orders (Status: complete_orders)

}