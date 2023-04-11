class AuthModel {
  final String fullName, dob, gender, phoneNumber, createdAt;
  final int id, isActive, isSubscribe;

  AuthModel({
    required this.id,
    required this.fullName,
    required this.dob,
    required this.gender,
    required this.phoneNumber,
    required this.isActive,
    required this.isSubscribe,
    required this.createdAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
        id: json['id'],
        fullName: json['full_name'],
        dob: json['dob'],
        gender: json['gender'],
        phoneNumber: json['phone_number'],
        isActive: json['is_active'],
        isSubscribe: json['is_subscribe'],
        createdAt: json['created_at']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "full_name": fullName,
        "dob": dob,
        "gender": gender,
        "phone_number": phoneNumber,
        "is_active": isActive,
        "is_subscribe": isSubscribe,
        "created_at": createdAt
      };
}
