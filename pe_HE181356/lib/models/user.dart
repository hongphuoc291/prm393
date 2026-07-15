class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String avatar;

  const UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatar,
  });

  UserModel copyWith({
    int? id,
    String? fullName,
    String? email,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
    );
  }

  factory UserModel.fromMap(Map<String, Object?> map) {
    return UserModel(
      id: map['id'] as int,
      fullName: map['full_name'] as String,
      email: map['email'] as String,
      avatar: map['avatar'] as String,
    );
  }

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'full_name': fullName,
      'email': email,
      'avatar': avatar,
    };
  }
}