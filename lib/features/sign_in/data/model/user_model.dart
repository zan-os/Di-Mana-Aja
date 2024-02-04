// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:di_mana_aja/features/sign_in/domain/entities/user_entity.dart';

class UserModel {
  final String name;
  final String avatarUrl;
  final String userUid;
  final String email;

  UserModel({
    this.name = '',
    this.avatarUrl = '',
    this.userUid = '',
    this.email = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'avatar_url': avatarUrl,
      'user_uid': userUid,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: (map['name'] ?? '') as String,
      avatarUrl: (map['avatar_url'] ?? '') as String,
      userUid: (map['user_id'] ?? '') as String,
      email: (map['email'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        avatarUrl: entity.avatarUrl,
        name: entity.name,
        email: entity.email,
        userUid: entity.userUid,
      );

  @override
  String toString() {
    return 'UserModel(name: $name, avatarUrl: $avatarUrl, userUid: $userUid, email: $email)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.avatarUrl == avatarUrl &&
        other.userUid == userUid &&
        other.email == email;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        avatarUrl.hashCode ^
        userUid.hashCode ^
        email.hashCode;
  }
}
