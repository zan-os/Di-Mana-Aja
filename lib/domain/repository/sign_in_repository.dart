import 'package:di_mana_aja/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepository {
  Future<UserCredential> signInWithGoogle();
  Future<void> registerUser({required UserEntity user});
}
