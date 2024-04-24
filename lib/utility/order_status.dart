import 'package:flutter/material.dart';

class OrderStatus{
  static const String cancelled = "cancelled";
  static const String pending = "pending";
  static const String accepted = "accepted";
  static const String readyForPickup = "ready_for_pickup";
  static const String rider_confirmed = "rider_confirmed";
  static const String rider_confirmed_pickup_arrival = "rider_confirmed_pickup_arrival";
  static const String rider_picked_up = "rider_picked_up";
  static const String rider_confirmed_dropoff_arrival = "rider_confirmed_dropoff_arrival";
  static const String completed = "completed";
  static const String schedule = "schedule";
  static const String unpaid = "Unpaid";



  //set order status staticly
  static String setOrderStatus(String orderStatus){
    if(orderStatus == cancelled){
      return "Cancelled";
    }else if(orderStatus == pending){
      return "New Order";
    }else if(orderStatus == accepted){
      return "Accepted Order";
    }else if(orderStatus == readyForPickup){
      return "Ready for pickup";
    }else if(orderStatus == rider_confirmed){
      return "Rider confirmed order";
    }else if(orderStatus == rider_confirmed_dropoff_arrival){
      return "Rider confirmed drop-off arrival";
    }else if(orderStatus == rider_picked_up){
      return "Rider picked up";
    }else if(orderStatus == rider_confirmed_pickup_arrival){
      return "Rider confirmed pick-off arrival";
    }else if(orderStatus == completed){
      return "Completed";
    }else if(orderStatus == schedule){
      return "Schedule Order";
    }else{
      return "No Order Status";
    }
  }
}