import 'dart:convert';

import '../utils/api_endpoints.dart';

List<MySubscribeModel> mySubscribeModelFromJson(String str) =>
    List<MySubscribeModel>.from(
        json.decode(str).map((x) => MySubscribeModel.fromJson(x)));

String mySubscribeModelToJson(List<MySubscribeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MySubscribeModel {
  int? id;
  int? subscriberId;
  int? masterId;
  double? fee;
  DateTime? renewDate;
  int? status;
  int? autoRenew;
  DateTime? createdAt;
  DateTime? updatedAt;
  Masters? masters;
  Subscribers? subscribers;

  MySubscribeModel({
    this.id,
    this.subscriberId,
    this.masterId,
    this.fee,
    this.renewDate,
    this.status,
    this.autoRenew,
    this.createdAt,
    this.updatedAt,
    this.masters,
    this.subscribers,
  });

  factory MySubscribeModel.fromJson(Map<String, dynamic> json) =>
      MySubscribeModel(
        id: json["id"],
        subscriberId: json["subscriber_id"],
        masterId: json["master_id"],
        fee: json["fee"]?.toDouble(),
        renewDate: json["renew_date"] == null
            ? null
            : DateTime.parse(json["renew_date"]),
        status: json["status"],
        autoRenew: json["auto_renew"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        masters:
            json["masters"] == null ? null : Masters.fromJson(json["masters"]),
        subscribers: json["subscribers"] == null
            ? null
            : Subscribers.fromJson(json["subscribers"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subscriber_id": subscriberId,
        "master_id": masterId,
        "fee": fee,
        "renew_date": renewDate?.toIso8601String(),
        "status": status,
        "auto_renew": autoRenew,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "masters": masters?.toJson(),
        "subscribers": subscribers?.toJson(),
      };
}

class Masters {
  int? id;
  String? khName;
  String? enName;
  int? feeKhr;
  double? feeUsd;
  int? status;
  String? profile;
  DateTime? createdAt;
  DateTime? updatedAt;

  Masters({
    this.id,
    this.khName,
    this.enName,
    this.feeKhr,
    this.feeUsd,
    this.status,
    this.profile,
    this.createdAt,
    this.updatedAt,
  });

  factory Masters.fromJson(Map<String, dynamic> json) => Masters(
        id: json["id"],
        khName: json["kh_name"],
        enName: json["en_name"],
        feeKhr: json["fee_khr"],
        feeUsd: json["fee_usd"]?.toDouble(),
        status: json["status"],
        profile: BaseUrl.IMAGE_URL + json["profile"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kh_name": khName,
        "en_name": enName,
        "fee_khr": feeKhr,
        "fee_usd": feeUsd,
        "status": status,
        "profile": profile,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Subscribers {
  int? id;
  String? fullName;
  DateTime? dob;
  String? gender;
  String? phoneNumber;
  int? isAuth;
  int? isActive;
  int? isSubscribe;
  DateTime? createdAt;
  DateTime? updatedAt;

  Subscribers({
    this.id,
    this.fullName,
    this.dob,
    this.gender,
    this.phoneNumber,
    this.isAuth,
    this.isActive,
    this.isSubscribe,
    this.createdAt,
    this.updatedAt,
  });

  factory Subscribers.fromJson(Map<String, dynamic> json) => Subscribers(
        id: json["id"],
        fullName: json["full_name"],
        dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
        gender: json["gender"],
        phoneNumber: json["phone_number"],
        isAuth: json["is_auth"],
        isActive: json["is_active"],
        isSubscribe: json["is_subscribe"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "gender": gender,
        "phone_number": phoneNumber,
        "is_auth": isAuth,
        "is_active": isActive,
        "is_subscribe": isSubscribe,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
