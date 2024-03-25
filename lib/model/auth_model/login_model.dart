// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String? token;
  final UserInfo? userInfo;
  final dynamic created;

  LoginModel({
    this.token,
    this.userInfo,
    this.created,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    token: json["token"],
    userInfo: json["user_info"] == null ? null : UserInfo.fromJson(json["user_info"]),
    created: json["created"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "user_info": userInfo?.toJson(),
    "created": created,
  };
}

class UserInfo {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final int? rewardPoints;
  final String? companyName;

  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.rewardPoints,
    this.companyName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    rewardPoints: json["reward_points"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "reward_points": rewardPoints,
    "company_name": companyName,
  };
}
