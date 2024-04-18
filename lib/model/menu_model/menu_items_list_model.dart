class MenuItemsListModel {
  MenuItemsListModel({
    required this.id,
    required this.title,
    required this.description,
    required this.showing,
    required this.isClosed,
    required this.menuitemSet,
    required this.categorySet,
    required this.slug,
    required this.openingHours,
    required this.categoriesList,
  });

  final int id;
  final String title;
  final String description;
  final int showing;
  final bool isClosed;
  final List<MenuitemSet> menuitemSet;
  final List<Categor> categorySet;
  final String slug;
  final List<dynamic> openingHours;
  final List<Categor> categoriesList;

  factory MenuItemsListModel.fromJson(Map<String, dynamic> json) {
    return MenuItemsListModel(
      id: json["id"] ?? 0,
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      showing: json["showing"] ?? 0,
      isClosed: json["is_closed"] ?? false,
      menuitemSet: json["menuitem_set"] == null ? [] : List<MenuitemSet>.from(json["menuitem_set"]!.map((x) => MenuitemSet.fromJson(x))),
      categorySet: json["category_set"] == null ? [] : List<Categor>.from(json["category_set"]!.map((x) => Categor.fromJson(x))),
      slug: json["slug"] ?? "",
      openingHours: json["opening_hours"] == null ? [] : List<dynamic>.from(json["opening_hours"]!.map((x) => x)),
      categoriesList: json["categories_list"] == null ? [] : List<Categor>.from(json["categories_list"]!.map((x) => Categor.fromJson(x))),
    );
  }
}

class Categor {
  Categor({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Categor.fromJson(Map<String, dynamic> json) {
    return Categor(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
    );
  }
}

class MenuitemSet {
  MenuitemSet({
    required this.id,
    required this.name,
    required this.description,
    required this.basePrice,
    required this.isAvailable,
    required this.originalImage,
    required this.likeCount,
    required this.isCurrentUserLiked,
    required this.category,
    required this.hasModifier,
    required this.images,
  });

  final int id;
  final String name;
  final String description;
  final double basePrice;
  final bool isAvailable;
  final ImageModel? originalImage;
  final int likeCount;
  final dynamic isCurrentUserLiked;
  final List<int> category;
  final bool hasModifier;
  final List<ImageModel> images;

  factory MenuitemSet.fromJson(Map<String, dynamic> json) {
    return MenuitemSet(
      id: json["id"] ?? 0,
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      basePrice: json["base_price"] ?? 0,
      isAvailable: json["is_available"] ?? false,
      originalImage: json["original_image"] == null ? null : ImageModel.fromJson(json["original_image"]),
      likeCount: json["like_count"] ?? 0,
      isCurrentUserLiked: json["is_current_user_liked"],
      category: json["category"] == null ? [] : List<int>.from(json["category"]!.map((x) => x)),
      hasModifier: json["has_modifier"] ?? false,
      images: json["images"] == null ? [] : List<ImageModel>.from(json["images"]!.map((x) => ImageModel.fromJson(x))),
    );
  }
}

class ImageModel {
  ImageModel({
    required this.id,
    required this.workingUrl,
    required this.createdDate,
    required this.modifiedDate,
    required this.remoteUrl,
    required this.localUrl,
    required this.otterImageId,
  });

  final int id;
  final String workingUrl;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String remoteUrl;
  final dynamic localUrl;
  final String otterImageId;

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json["id"] ?? 0,
      workingUrl: json["working_url"] ?? "",
      createdDate: DateTime.tryParse(json["created_date"] ?? ""),
      modifiedDate: DateTime.tryParse(json["modified_date"] ?? ""),
      remoteUrl: json["remote_url"] ?? "",
      localUrl: json["local_url"],
      otterImageId: json["otter_image_id"] ?? "",
    );
  }
}
