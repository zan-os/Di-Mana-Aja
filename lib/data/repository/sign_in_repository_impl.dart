import 'package:di_mana_aja/domain/entities/user_entity.dart';
import 'package:di_mana_aja/domain/repository/sign_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../datasource/remote/sign_in_remote_datasource.dart';
import '../model/user_model.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource _remoteDataSource;

  SignInRepositoryImpl({required SignInRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<UserCredential> signInWithGoogle() async =>
      _remoteDataSource.signInWithGoogle();

  @override
  Future<void> registerUser({required UserEntity user}) async {
    final userModel = UserModel.fromEntity(user);
    return _remoteDataSource.registerUser(user: userModel);
  }
}
