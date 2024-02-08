import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashRemoteDataSource {
  Future<bool> checkCredential();
}

class SplashRemoteDataSourceImpl implements SplashRemoteDataSource {
  @override
  Future<bool> checkCredential() async {
    try {
      final credential = FirebaseAuth.instance.currentUser;
      return (credential != null);
    } catch (e) {
      rethrow;
    }
  }
}
