import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/features/sign_in/domain/entities/user_entity.dart';
import 'package:di_mana_aja/features/sign_in/domain/repository/sign_in_repository.dart';
import 'package:di_mana_aja/features/sign_in/domain/usecase/register_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInWithGoogle extends BaseUseCase<UserCredential, NoParams> {
  final SignInRepository _signinRepository;
  final RegisterUser _registerUser;

  SignInWithGoogle(
      {required SignInRepository signinRepository,
      required RegisterUser registerUser})
      : _signinRepository = signinRepository,
        _registerUser = registerUser;

  @override
  Future<UserCredential> call(NoParams params) async {
    try {
      final credential = await _signinRepository.signInWithGoogle();

      await _registerUser.call(
        UserEntity(
          name: credential.user?.displayName ?? 'No Display Name',
          email: credential.user?.email ?? 'No Email',
          avatarUrl: credential.user?.photoURL ?? 'No Photo',
          userUid: credential.user!.uid,
        ),
      );

      return credential;
    } catch (e) {
      rethrow;
    }
  }
}
