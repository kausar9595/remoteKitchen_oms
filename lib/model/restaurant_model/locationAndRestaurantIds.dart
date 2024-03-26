// To parse this JSON data, do
//
//     final locationAndRestaurantIds = locationAndRestaurantIdsFromJson(jsonString);

import 'dart:convert';

LocationAndRestaurantIds locationAndRestaurantIdsFromJson(String str) => LocationAndRestaurantIds.fromJson(json.decode(str));

String locationAndRestaurantIdsToJson(LocationAndRestaurantIds data) => json.encode(data.toJson());

class LocationAndRestaurantIds {
  final String? locationId;
  final String? restaurantId;

  LocationAndRestaurantIds({
    this.locationId,
    this.restaurantId,
  });

  factory LocationAndRestaurantIds.fromJson(Map<String, dynamic> json) => LocationAndRestaurantIds(
    locationId: json["location_id"],
    restaurantId: json["restaurant_id"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "restaurant_id": restaurantId,
  };
}
