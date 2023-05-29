import 'dart:convert';

import '../utils/api_endpoints.dart';

List<MasterModel> masterModelFromJson(String str) => List<MasterModel>.from(
    json.decode(str).map((x) => MasterModel.fromJson(x)));

String masterModelToJson(List<MasterModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MasterModel {
  int? id;
  String? khName;
  String? enName;
  int? feeKhr;
  double? feeUsd;
  String? profile;
  int? status;
  bool? isSubscribed;
  DateTime? createdAt;

  MasterModel({
    required this.id,
    required this.khName,
    required this.enName,
    required this.feeKhr,
    required this.feeUsd,
    required this.profile,
    required this.status,
    required this.isSubscribed,
    required this.createdAt,
  });

  factory MasterModel.fromJson(Map<String, dynamic> json) => MasterModel(
        id: json["id"],
        khName: json["kh_name"],
        enName: json["en_name"],
        feeKhr: json["fee_khr"],
        feeUsd: json["fee_usd"]?.toDouble(),
        profile: BaseUrl.IMAGE_URL + json["profile"],
        status: json["status"],
        isSubscribed: json["isSubscribed"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kh_name": khName,
        "en_name": enName,
        "fee_khr": feeKhr,
        "fee_usd": feeUsd,
        "profile": profile,
        "status": status,
        "isSubscribed": isSubscribed,
        "created_at": createdAt?.toIso8601String(),
      };
}
