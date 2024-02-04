import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/features/sign_in/domain/entities/user_entity.dart';
import 'package:di_mana_aja/features/sign_in/domain/repository/sign_in_repository.dart';

class RegisterUser extends BaseUseCase<void, UserEntity> {
  final SignInRepository _signinRepository;

  RegisterUser({required SignInRepository signinRepository})
      : _signinRepository = signinRepository;

  @override
  Future<void> call(UserEntity params) async {
    try {
      final credential = await _signinRepository.registerUser(user: params);

      return credential;
    } catch (e) {
      rethrow;
    }
  }
}
