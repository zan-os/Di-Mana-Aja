import 'package:di_mana_aja/features/splash_screen/domain/usecase/check_credential.dart';

import '../../../registered_injection.dart';
import '../data/datasource/remote/splash_remote_datasource.dart';
import '../data/repository/splash_repository_impl.dart';
import '../domain/repository/splash_repository.dart';

class SplashScreenInjection {
  SplashScreenInjection() {
    _registerDataSource();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<SplashRemoteDataSource>(
      () => SplashRemoteDataSourceImpl(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<SplashRepository>(
      () => SplashRepositoryImpl(remoteDataSource: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<CheckCredential>(
      () => CheckCredential(splashRepository: sl()),
    );
  }
}
