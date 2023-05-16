class MasterModel {
  final String khName, enName, profile, status, createdAt;
  final int id;
  final double feeKhr, feeUsd;

  MasterModel({
    required this.id,
    required this.khName,
    required this.enName,
    required this.profile,
    required this.feeKhr,
    required this.feeUsd,
    required this.status,
    required this.createdAt,
  });

  factory MasterModel.fromJson(Map<String, dynamic> json) {
    return MasterModel(
        id: json['id'],
        khName: json['kh_name'],
        enName: json['en_name'],
        profile: json['profile'],
        feeKhr: json['fee_khr'],
        feeUsd: json['fee_usd'],
        status: json['status'],
        createdAt: json['created_at']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "kh_name": khName,
        "en_name": enName,
        "profile": profile,
        "fee_khr": feeKhr,
        "fee_usd": feeUsd,
        "status": status,
        "created_at": createdAt
      };
}
