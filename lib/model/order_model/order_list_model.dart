// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  final Links? links;
  final int? count;
  final List<OrderResult>? results;

  OrderListModel({
    this.links,
    this.count,
    this.results,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    links: json["links"] == null ? null : Links.fromJson(json["links"]),
    count: json["count"],
    results: json["results"] == null ? [] : List<OrderResult>.from(json["results"]!.map((x) => OrderResult.fromJson(x))),
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

class OrderResult {
  final int? id;
  final List<OrderitemSet>? orderitemSet;
  final String? voucher;
  final dynamic pickupAddressDetails;
  final dynamic dropoffAddressDetails;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final String? customer;
  final String? orderId;
  final String? status;
  final String? statusBeforeCancelled;
  final double? refundAmount;
  final int? quantity;
  final double? subtotal;
  final double? deliveryFee;
  final double? originalDeliveryFee;
  final double? deliveryDiscount;
  final double? tax;
  final double? convenienceFee;
  final double? discount;
  final double? total;
  final double? tips;
  final Currency? currency;
  final bool? isPaid;
  final DateTime? receiveDate;
  final DateTime? pickupTime;
  final DateTime? deliveryTime;
  final String? deliveryPlatform;
  final String? pickupAddress;
  final String? dropoffAddress;
  final DropoffLocation? dropoffLocation;
  final String? dropoffPhoneNumber;
  final String? dropoffContactFirstName;
  final String? dropoffContactLastName;
  final String? trackingUrl;
  final String? supportReference;
  final String? dasherDropoffPhoneNumber;
  final String? dasherPickupPhoneNumber;
  final String? cancellationReason;
  final String? orderMethod;
  final SchedulingType? schedulingType;
  final dynamic scheduledTime;
  final DropoffLocation? extra;
  final OrderType? orderType;
  final int? user;
  final int? company;
  final int? restaurant;
  final int? location;
  final int? purchase;
  final dynamic bogo;
  final dynamic rewardCoupon;
  final dynamic spendXSaveY;
  final dynamic externalPlatform;
  final List<dynamic>? posData;

  OrderResult({
    this.id,
    this.orderitemSet,
    this.voucher,
    this.pickupAddressDetails,
    this.dropoffAddressDetails,
    this.createdDate,
    this.modifiedDate,
    this.customer,
    this.orderId,
    this.status,
    this.statusBeforeCancelled,
    this.refundAmount,
    this.quantity,
    this.subtotal,
    this.deliveryFee,
    this.originalDeliveryFee,
    this.deliveryDiscount,
    this.tax,
    this.convenienceFee,
    this.discount,
    this.total,
    this.tips,
    this.currency,
    this.isPaid,
    this.receiveDate,
    this.pickupTime,
    this.deliveryTime,
    this.deliveryPlatform,
    this.pickupAddress,
    this.dropoffAddress,
    this.dropoffLocation,
    this.dropoffPhoneNumber,
    this.dropoffContactFirstName,
    this.dropoffContactLastName,
    this.trackingUrl,
    this.supportReference,
    this.dasherDropoffPhoneNumber,
    this.dasherPickupPhoneNumber,
    this.cancellationReason,
    this.orderMethod,
    this.schedulingType,
    this.scheduledTime,
    this.extra,
    this.orderType,
    this.user,
    this.company,
    this.restaurant,
    this.location,
    this.purchase,
    this.bogo,
    this.rewardCoupon,
    this.spendXSaveY,
    this.externalPlatform,
    this.posData,
  });

  factory OrderResult.fromJson(Map<String, dynamic> json) => OrderResult(
    id: int.parse("${json["id"]}"),
    orderitemSet: json["orderitem_set"] == null ? [] : List<OrderitemSet>.from(json["orderitem_set"]!.map((x) => OrderitemSet.fromJson(x))),
    voucher: json["voucher"],
    pickupAddressDetails: json["pickup_address_details"],
    dropoffAddressDetails: json["dropoff_address_details"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    customer: json["customer"]!,
    orderId: json["order_id"],
    status: json["status"],
    statusBeforeCancelled: json["status_before_cancelled"]!,
    refundAmount: json["refund_amount"]?.toDouble(),
    quantity: json["quantity"],
    subtotal: json["subtotal"]?.toDouble(),
    deliveryFee: json["delivery_fee"],
    originalDeliveryFee: json["original_delivery_fee"],
    deliveryDiscount: json["delivery_discount"],
    tax: json["tax"]?.toDouble(),
    convenienceFee: json["convenience_fee"],
    discount: json["discount"]?.toDouble(),
    total: json["total"]?.toDouble(),
    tips: json["tips"],
    currency: currencyValues.map[json["currency"]]!,
    isPaid: json["is_paid"],
    receiveDate: json["receive_date"] == null ? null : DateTime.parse(json["receive_date"]),
    pickupTime: json["pickup_time"] == null ? null : DateTime.parse(json["pickup_time"]),
    deliveryTime: json["delivery_time"] == null ? null : DateTime.parse(json["delivery_time"]),
    deliveryPlatform: json["delivery_platform"]!,
    pickupAddress: json["pickup_address"]!,
    dropoffAddress: json["dropoff_address"],
    dropoffLocation: json["dropoff_location"] == null ? null : DropoffLocation.fromJson(json["dropoff_location"]),
    dropoffPhoneNumber: json["dropoff_phone_number"],
    dropoffContactFirstName: json["dropoff_contact_first_name"]!,
    dropoffContactLastName: json["dropoff_contact_last_name"]!,
    trackingUrl: json["tracking_url"],
    supportReference: json["support_reference"],
    dasherDropoffPhoneNumber: json["dasher_dropoff_phone_number"],
    dasherPickupPhoneNumber: json["dasher_pickup_phone_number"],
    cancellationReason: json["cancellation_reason"],
    orderMethod: json["order_method"]!,
    schedulingType: schedulingTypeValues.map[json["scheduling_type"]]!,
    scheduledTime: json["scheduled_time"],
    extra: json["extra"] == null ? null : DropoffLocation.fromJson(json["extra"]),
    orderType: orderTypeValues.map[json["order_type"]]!,
    user: json["user"],
    company: json["company"],
    restaurant: json["restaurant"],
    location: json["location"],
    purchase: json["purchase"],
    bogo: json["bogo"],
    rewardCoupon: json["reward_coupon"],
    spendXSaveY: json["spend_x_save_y"],
    externalPlatform: json["external_platform"],
    posData: json["pos_data"] == null ? [] : List<dynamic>.from(json["pos_data"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderitem_set": orderitemSet == null ? [] : List<dynamic>.from(orderitemSet!.map((x) => x.toJson())),
    "voucher": voucher,
    "pickup_address_details": pickupAddressDetails,
    "dropoff_address_details": dropoffAddressDetails,
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "customer": customer,
    "order_id": orderId,
    "status": status,
    "status_before_cancelled": statusBeforeCancelled,
    "refund_amount": refundAmount,
    "quantity": quantity,
    "subtotal": subtotal,
    "delivery_fee": deliveryFee,
    "original_delivery_fee": originalDeliveryFee,
    "delivery_discount": deliveryDiscount,
    "tax": tax,
    "convenience_fee": convenienceFee,
    "discount": discount,
    "total": total,
    "tips": tips,
    "currency": currencyValues.reverse[currency],
    "is_paid": isPaid,
    "receive_date": receiveDate?.toIso8601String(),
    "pickup_time": pickupTime?.toIso8601String(),
    "delivery_time": deliveryTime?.toIso8601String(),
    "delivery_platform": deliveryPlatform,
    "pickup_address": pickupAddress,
    "dropoff_address": dropoffAddress,
    "dropoff_location": dropoffLocation?.toJson(),
    "dropoff_phone_number": dropoffPhoneNumber,
    "dropoff_contact_first_name": dropoffContactFirstName,
    "dropoff_contact_last_name": dropoffContactLastName,
    "tracking_url": trackingUrl,
    "support_reference": supportReference,
    "dasher_dropoff_phone_number": dasherDropoffPhoneNumber,
    "dasher_pickup_phone_number": dasherPickupPhoneNumber,
    "cancellation_reason": cancellationReason,
    "order_method": orderMethodValues.reverse[orderMethod],
    "scheduling_type": schedulingTypeValues.reverse[schedulingType],
    "scheduled_time": scheduledTime,
    "extra": extra?.toJson(),
    "order_type": orderTypeValues.reverse[orderType],
    "user": user,
    "company": company,
    "restaurant": restaurant,
    "location": location,
    "purchase": purchase,
    "bogo": bogo,
    "reward_coupon": rewardCoupon,
    "spend_x_save_y": spendXSaveY,
    "external_platform": externalPlatform,
    "pos_data": posData == null ? [] : List<dynamic>.from(posData!.map((x) => x)),
  };
}

enum Currency {
  CAD,
  USD
}

final currencyValues = EnumValues({
  "cad": Currency.CAD,
  "usd": Currency.USD
});




class DropoffLocation {
  DropoffLocation();

  factory DropoffLocation.fromJson(Map<String, dynamic> json) => DropoffLocation(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum OrderMethod {
  DELIVERY,
  PICKUP
}

final orderMethodValues = EnumValues({
  "delivery": OrderMethod.DELIVERY,
  "pickup": OrderMethod.PICKUP
});

enum OrderType {
  INTERNAL
}

final orderTypeValues = EnumValues({
  "internal": OrderType.INTERNAL
});

class OrderitemSet {
  final int? id;
  final String? itemName;
  final double? itemPrice;
  final List<dynamic>? modifiers;
  final DateTime? createdDate;
  final DateTime? modifiedDate;
  final int? quantity;
  final int? order;
  final int? menuItem;

  OrderitemSet({
    this.id,
    this.itemName,
    this.itemPrice,
    this.modifiers,
    this.createdDate,
    this.modifiedDate,
    this.quantity,
    this.order,
    this.menuItem,
  });

  factory OrderitemSet.fromJson(Map<String, dynamic> json) => OrderitemSet(
    id: json["id"],
    itemName: json["item_name"]!,
    itemPrice: json["item_price"]?.toDouble(),
    modifiers: json["modifiers"] == null ? [] : List<dynamic>.from(json["modifiers"]!.map((x) => x)),
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    modifiedDate: json["modified_date"] == null ? null : DateTime.parse(json["modified_date"]),
    quantity: json["quantity"],
    order: json["order"],
    menuItem: json["menu_item"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "item_name": itemNameValues.reverse[itemName],
    "item_price": itemPrice,
    "modifiers": modifiers == null ? [] : List<dynamic>.from(modifiers!.map((x) => x)),
    "created_date": createdDate?.toIso8601String(),
    "modified_date": modifiedDate?.toIso8601String(),
    "quantity": quantity,
    "order": order,
    "menu_item": menuItem,
  };
}

enum ItemName {
  CHOPPED_SALAD_SHIRAZI,
  KACCHI_6,
  YELLOW_SPLIT_PEA_STEW
}

final itemNameValues = EnumValues({
  "Chopped Salad(Shirazi)": ItemName.CHOPPED_SALAD_SHIRAZI,
  "Kacchi 6": ItemName.KACCHI_6,
  "Yellow split pea stew": ItemName.YELLOW_SPLIT_PEA_STEW
});



enum SchedulingType {
  ASAP
}

final schedulingTypeValues = EnumValues({
  "asap": SchedulingType.ASAP
});

enum StatusBeforeCancelled {
  ACCEPTED,
  N_A,
  PENDING
}

final statusBeforeCancelledValues = EnumValues({
  "accepted": StatusBeforeCancelled.ACCEPTED,
  "n/a": StatusBeforeCancelled.N_A,
  "pending": StatusBeforeCancelled.PENDING
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
