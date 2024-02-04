import '../../domain/repository/splash_repository.dart';
import '../datasource/remote/splash_remote_datasource.dart';

class SplashRepositoryImpl implements SplashRepository {
  final SplashRemoteDataSource _remoteDataSource;

  SplashRepositoryImpl({required SplashRemoteDataSource remoteDataSource})
      : _remoteDataSource = remoteDataSource;

  @override
  Future<bool> checkCredential() async => _remoteDataSource.checkCredential();
}
