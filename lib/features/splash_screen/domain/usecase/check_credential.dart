import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/features/splash_screen/domain/repository/splash_repository.dart';

class CheckCredential extends BaseUseCase<bool, NoParams> {
  final SplashRepository _splashRepository;

  CheckCredential({required SplashRepository splashRepository})
      : _splashRepository = splashRepository;

  @override
  Future<bool> call(NoParams params) => _splashRepository.checkCredential();
}
