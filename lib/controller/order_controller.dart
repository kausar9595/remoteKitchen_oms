import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:oms/app_config.dart';
import 'package:oms/controller/api.dart';
import 'package:oms/controller/restaurant_controller.dart';
import 'package:oms/utility/order_status.dart';

import '../model/order_model/order_list_model.dart';

class OrderController{

  static const String locationId = "";
  static const String restaurantId = "";
  //store restaurant and location id


  //get incoming orders (Status: Pending)
  static Future<OrderListModel> getPendingOrder()async{
    var ids = await RestaurantController.getLocationAndRestaurantIds();
    var response = await Api.getApi(url: AppConfig.ORDER_LIST+"?restaurant=${ids.restaurantId}&location=${ids.locationId}");
    return OrderListModel.fromJson(jsonDecode(response.body));
  }


  //change the order status
  static Future<http.Response> changeStatus(id, status)async{
    var response = await Api.pathch(url: AppConfig.ORDER_STATUS+"?id=${id}",
        body: {
          "status" : status,
        }
    );
    print("response  ${response.statusCode}");
    print("response  ${response.body}");
    return response;
  }

  //order cancel / reject
  static Future<http.Response> orderReject(id, refund_amount)async{
    var response = await Api.putApi(url: AppConfig.ORDER_STATUS+"?id=${id}",
        body: {
          "status" : OrderStatus.cancelled,
          "refund_amount" : refund_amount
        }
    );
    return response;
  }

  //get Complete orders (Status: complete_orders)

}