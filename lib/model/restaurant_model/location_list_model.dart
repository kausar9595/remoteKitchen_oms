// To parse this JSON data, do
//
//     final locationListModel = locationListModelFromJson(jsonString);

import 'dart:convert';

LocationListModel locationListModelFromJson(String str) => LocationListModel.fromJson(json.decode(str));

String locationListModelToJson(LocationListModel data) => json.encode(data.toJson());

class LocationListModel {
  final Links? links;
  final int? count;
  final List<LocationResult>? results;

  LocationListModel({
    this.links,
    this.count,
    this.results,
  });

  factory LocationListModel.fromJson(Map<String, dynamic> json) => LocationListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<LocationResult>.from(json["results"]!.map((x) => LocationResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Links {
  final dynamic next;
  final dynamic previous;

  Links({
    this.next,
    this.previous,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    next: json["next"],
    previous: json["previous"],
  );

  Map<String, dynamic> toJson() => {
    "next": next,
    "previous": previous,
  };
}

class LocationResult {
  final int? id;
  final List<ResultOpeningHour>? openingHours;
  final String? restaurantName;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? details;
  final bool? directOrder;
  final String? phone;
  final String? email;
  final String? doordashExternalStoreId;
  final dynamic otterXStoreId;
  final dynamic otterXEventId;
  final bool? isMenuImporting;
  final bool? isMenuImported;
  final bool? isLocationClosed;
  final int? restaurant;

  LocationResult({
    this.id,
    this.openingHours,
    this.restaurantName,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.details,
    this.directOrder,
    this.phone,
    this.email,
    this.doordashExternalStoreId,
    this.otterXStoreId,
    this.otterXEventId,
    this.isMenuImporting,
    this.isMenuImported,
    this.isLocationClosed,
    this.restaurant,
  });

  factory LocationResult.fromJson(Map<String, dynamic> json) => LocationResult(
    id: json["id"],
    openingHours: json["opening_hours"] == null ? [] : List<ResultOpeningHour>.from(json["opening_hours"]!.map((x) => ResultOpeningHour.fromJson(x))),
    restaurantName: json["restaurant_name"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    details: json["details"],
    directOrder: json["direct_order"],
    phone: json["phone"],
    email: json["email"],
    doordashExternalStoreId: json["doordash_external_store_id"],
    otterXStoreId: json["otter_x_store_id"],
    otterXEventId: json["otter_x_event_id"],
    isMenuImporting: json["is_menu_importing"],
    isMenuImported: json["is_menu_imported"],
    isLocationClosed: json["is_location_closed"],
    restaurant: json["restaurant"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hours": openingHours == null ? [] : List<dynamic>.from(openingHours!.map((x) => x.toJson())),
    "restaurant_name": restaurantName,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "details": details,
    "direct_order": directOrder,
    "phone": phone,
    "email": email,
    "doordash_external_store_id": doordashExternalStoreId,
    "otter_x_store_id": otterXStoreId,
    "otter_x_event_id": otterXEventId,
    "is_menu_importing": isMenuImporting,
    "is_menu_imported": isMenuImported,
    "is_location_closed": isLocationClosed,
    "restaurant": restaurant,
  };
}

class ResultOpeningHour {
  final int? id;
  final List<OpeningHourOpeningHour>? openingHour;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? dayIndex;
  final bool? isClose;

  ResultOpeningHour({
    this.id,
    this.openingHour,
    this.createdDate,
    this.modifiedDate,
    this.dayIndex,
    this.isClose,
  });

  factory ResultOpeningHour.fromJson(Map<String, dynamic> json) => ResultOpeningHour(
    id: json["id"],
    openingHour: json["opening_hour"] == null ? [] : List<OpeningHourOpeningHour>.from(json["opening_hour"]!.map((x) => OpeningHourOpeningHour.fromJson(x))),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    dayIndex: json["day_index"],
    isClose: json["is_close"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hour": openingHour == null ? [] : List<dynamic>.from(openingHour!.map((x) => x.toJson())),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "day_index": dayIndex,
    "is_close": isClose,
  };
}

class OpeningHourOpeningHour {
  final int? id;
  final String? startTime;
  final String? endTime;

  OpeningHourOpeningHour({
    this.id,
    this.startTime,
    this.endTime,
  });

  factory OpeningHourOpeningHour.fromJson(Map<String, dynamic> json) => OpeningHourOpeningHour(
    id: json["id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime,
    "end_time": endTime,
  };
}
