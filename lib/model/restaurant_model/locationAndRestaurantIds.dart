// To parse this JSON data, do
//
//     final locationAndRestaurantIds = locationAndRestaurantIdsFromJson(jsonString);

import 'dart:convert';

LocationAndRestaurantIds locationAndRestaurantIdsFromJson(String str) => LocationAndRestaurantIds.fromJson(json.decode(str));

String locationAndRestaurantIdsToJson(LocationAndRestaurantIds data) => json.encode(data.toJson());

class LocationAndRestaurantIds {
  final String? locationId;
  final String? locationName;
  final String? restaurantId;
  final String? restaurantName;

  LocationAndRestaurantIds({
    this.locationId,
    this.locationName,
    this.restaurantId,
    this.restaurantName,
  });

  factory LocationAndRestaurantIds.fromJson(Map<String, dynamic> json) => LocationAndRestaurantIds(
    locationId: json["location_id"],
    locationName: json["location_name"],
    restaurantId: json["restaurant_id"],
    restaurantName: json["restaurant_name"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "location_name": locationName,
    "restaurant_id": restaurantId,
    "restaurant_name": restaurantName,
  };
}
