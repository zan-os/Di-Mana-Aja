import '../data/datasource/remote/sign_in_remote_datasource.dart';
import '../data/repository/sign_in_repository_impl.dart';
import '../domain/repository/sign_in_repository.dart';
import '../domain/usecase/register_user.dart';
import '../domain/usecase/sign_in_with_google.dart';
import '../registered_injection.dart';

class SignInInjection {
  SignInInjection() {
    _registerDataSource();
    _registerRepository();
    _registerUseCase();
  }

  _registerDataSource() {
    sl.registerLazySingleton<SignInRemoteDataSource>(
      () => SignInRemoteDataSourceImpl(),
    );
  }

  _registerRepository() {
    sl.registerLazySingleton<SignInRepository>(
      () => SignInRepositoryImpl(remoteDataSource: sl()),
    );
  }

  _registerUseCase() {
    sl.registerLazySingleton<RegisterUser>(
      () => RegisterUser(signinRepository: sl()),
    );

    sl.registerLazySingleton<SignInWithGoogle>(
      () => SignInWithGoogle(signinRepository: sl(), registerUser: sl()),
    );
  }
}
