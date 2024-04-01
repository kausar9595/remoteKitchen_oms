// To parse this JSON data, do
//
//     final orderCuriarInfoModel = orderCuriarInfoModelFromJson(jsonString);

import 'dart:convert';

OrderCuriarInfoModel orderCuriarInfoModelFromJson(String str) => OrderCuriarInfoModel.fromJson(json.decode(str));

String orderCuriarInfoModelToJson(OrderCuriarInfoModel data) => json.encode(data.toJson());

class OrderCuriarInfoModel {
  final String? dropoffAddress;
  final DropoffLocation? dropoffLocation;
  final String? pickupAddress;
  final dynamic pickupLocation;
  final dynamic dasherLocation;
  final dynamic dasherName;
  final dynamic dasherDropoffPhoneNumber;
  final dynamic dasherPickupPhoneNumber;

  OrderCuriarInfoModel({
    this.dropoffAddress,
    this.dropoffLocation,
    this.pickupAddress,
    this.pickupLocation,
    this.dasherLocation,
    this.dasherName,
    this.dasherDropoffPhoneNumber,
    this.dasherPickupPhoneNumber,
  });

  factory OrderCuriarInfoModel.fromJson(Map<String, dynamic> json) => OrderCuriarInfoModel(
    dropoffAddress: json["dropoff_address"],
    dropoffLocation: json["dropoff_location"] == null ? null : DropoffLocation.fromJson(json["dropoff_location"]),
    pickupAddress: json["pickup_address"],
    pickupLocation: json["pickup_location"],
    dasherLocation: json["dasher_location"],
    dasherName: json["dasher_name"],
    dasherDropoffPhoneNumber: json["dasher_dropoff_phone_number"],
    dasherPickupPhoneNumber: json["dasher_pickup_phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "dropoff_address": dropoffAddress,
    "dropoff_location": dropoffLocation?.toJson(),
    "pickup_address": pickupAddress,
    "pickup_location": pickupLocation,
    "dasher_location": dasherLocation,
    "dasher_name": dasherName,
    "dasher_dropoff_phone_number": dasherDropoffPhoneNumber,
    "dasher_pickup_phone_number": dasherPickupPhoneNumber,
  };
}

class DropoffLocation {
  final double? lat;
  final double? lng;

  DropoffLocation({
    this.lat,
    this.lng,
  });

  factory DropoffLocation.fromJson(Map<String, dynamic> json) => DropoffLocation(
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lat": lat,
    "lng": lng,
  };
}
