// To parse this JSON data, do
//
//     final menuListModel = menuListModelFromJson(jsonString);

import 'dart:convert';

MenuListModel menuListModelFromJson(String str) => MenuListModel.fromJson(json.decode(str));

String menuListModelToJson(MenuListModel data) => json.encode(data.toJson());

class MenuListModel {
  final Links? links;
  final int? count;
  final List<MenuListResult>? results;

  MenuListModel({
    this.links,
    this.count,
    this.results,
  });

  factory MenuListModel.fromJson(Map<String, dynamic> json) => MenuListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<MenuListResult>.from(json["results"]!.map((x) => MenuListResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "links": links?.toJson(),
    "count": count,
    "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
  };
}

class Links {
  final String? next;
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

class MenuListResult {
  final int? id;
  final String? title;
  final bool? isClosed;

  MenuListResult({
    this.id,
    this.title,
    this.isClosed,
  });

  factory MenuListResult.fromJson(Map<String, dynamic> json) => MenuListResult(
    id: json["id"],
    title: json["title"],
    isClosed: json["is_closed"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "is_closed": isClosed,
  };
}
