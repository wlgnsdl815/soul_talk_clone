class UserModel {
  final String id;
  final String email;
  final String name;
  final String? gender;
  final String? profileImageUrl;
  final String? nickname;
  final bool? isForeignResident;
  final String? phoneNumber;
  final DateTime? birthDate;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.gender,
    this.profileImageUrl,
    this.nickname,
    this.isForeignResident,
    this.phoneNumber,
    this.birthDate,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      gender: map['gender'],
      profileImageUrl: map['profile_image_url'],
      nickname: map['nickname'],
      isForeignResident: map['is_foreign_resident'],
      phoneNumber: map['phone_number'],
      birthDate:
          map['birthDate'] != null ? DateTime.parse(map['birthDate']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'gender': gender,
      'profile_image_url': profileImageUrl,
      'nickname': nickname,
      'is_foreign_resident': isForeignResident,
      'phone_number': phoneNumber,
      'birthDate': birthDate?.toIso8601String(),
    };
  }
}
