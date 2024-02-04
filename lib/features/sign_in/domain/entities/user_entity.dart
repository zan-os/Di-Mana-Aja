// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserEntity {
  UserEntity({
    this.name = '',
    this.avatarUrl = '',
    this.userUid = '',
    this.email = '',
  });

  final String name;
  final String avatarUrl;
  final String userUid;
  final String email;
}
