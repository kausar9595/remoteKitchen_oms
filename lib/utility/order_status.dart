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
}