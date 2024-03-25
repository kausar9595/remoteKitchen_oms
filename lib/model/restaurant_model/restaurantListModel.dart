// To parse this JSON data, do
//
//     final restaurantListModel = restaurantListModelFromJson(jsonString);

import 'dart:convert';

RestaurantListModel restaurantListModelFromJson(String str) => RestaurantListModel.fromJson(json.decode(str));

String restaurantListModelToJson(RestaurantListModel data) => json.encode(data.toJson());

class RestaurantListModel {
  final Links? links;
  final int? count;
  final List<RestaurantResult>? results;

  RestaurantListModel({
    this.links,
    this.count,
    this.results,
  });

  factory RestaurantListModel.fromJson(Map<String, dynamic> json) => RestaurantListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<RestaurantResult>.from(json["results"]!.map((x) => RestaurantResult.fromJson(x))),
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

class RestaurantResult {
  final int? id;
  final List<dynamic>? openingHours;
  final RImage? avatarImage;
  final RImage? bannerImage;
  final int? locationCnt;
  final int? menuCnt;
  final int? categoryCnt;
  final int? itemCnt;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? uid;
  final String? slug;
  final String? name;
  final String? location;
  final String? phone;
  final String? email;
  final String? doordashExternalStoreId;
  final bool? isStoreClose;
  final String? timezone;
  final int? inflationPercent;
  final double? rewardPointEquivalent;
  final int? owner;
  final int? company;
  final int? paymentDetails;

  RestaurantResult({
    this.id,
    this.openingHours,
    this.avatarImage,
    this.bannerImage,
    this.locationCnt,
    this.menuCnt,
    this.categoryCnt,
    this.itemCnt,
    this.createdDate,
    this.modifiedDate,
    this.uid,
    this.slug,
    this.name,
    this.location,
    this.phone,
    this.email,
    this.doordashExternalStoreId,
    this.isStoreClose,
    this.timezone,
    this.inflationPercent,
    this.rewardPointEquivalent,
    this.owner,
    this.company,
    this.paymentDetails,
  });

  factory RestaurantResult.fromJson(Map<String, dynamic> json) => RestaurantResult(
    id: json["id"],
    openingHours: json["opening_hours"] == null ? [] : List<dynamic>.from(json["opening_hours"]!.map((x) => x)),
    avatarImage: json["avatar_image"] == null ? null : RImage.fromJson(json["avatar_image"]),
    bannerImage: json["banner_image"] == null ? null : RImage.fromJson(json["banner_image"]),
    locationCnt: json["location_cnt"],
    menuCnt: json["menu_cnt"],
    categoryCnt: json["category_cnt"],
    itemCnt: json["item_cnt"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    uid: json["uid"],
    slug: json["slug"],
    name: json["name"],
    location: json["location"],
    phone: json["phone"],
    email: json["email"],
    doordashExternalStoreId: json["doordash_external_store_id"],
    isStoreClose: json["is_store_close"],
    timezone: json["timezone"],
    inflationPercent: json["inflation_percent"],
    rewardPointEquivalent: double.parse("${json["reward_point_equivalent"]}"),
    owner: json["owner"],
    company: json["company"],
    paymentDetails: json["payment_details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "opening_hours": openingHours == null ? [] : List<dynamic>.from(openingHours!.map((x) => x)),
    "avatar_image": avatarImage?.toJson(),
    "banner_image": bannerImage?.toJson(),
    "location_cnt": locationCnt,
    "menu_cnt": menuCnt,
    "category_cnt": categoryCnt,
    "item_cnt": itemCnt,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "uid": uid,
    "slug": slug,
    "name": name,
    "location": location,
    "phone": phone,
    "email": email,
    "doordash_external_store_id": doordashExternalStoreId,
    "is_store_close": isStoreClose,
    "timezone": timezone,
    "inflation_percent": inflationPercent,
    "reward_point_equivalent": rewardPointEquivalent,
    "owner": owner,
    "company": company,
    "payment_details": paymentDetails,
  };
}

class RImage {
  final int? id;
  final String? workingUrl;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? remoteUrl;
  final String? localUrl;
  final String? otterImageId;

  RImage({
    this.id,
    this.workingUrl,
    this.createdDate,
    this.modifiedDate,
    this.remoteUrl,
    this.localUrl,
    this.otterImageId,
  });

  factory RImage.fromJson(Map<String, dynamic> json) => RImage(
    id: json["id"],
    workingUrl: json["working_url"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    remoteUrl: json["remote_url"],
    localUrl: json["local_url"],
    otterImageId: json["otter_image_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "working_url": workingUrl,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "remote_url": remoteUrl,
    "local_url": localUrl,
    "otter_image_id": otterImageId,
  };
}
