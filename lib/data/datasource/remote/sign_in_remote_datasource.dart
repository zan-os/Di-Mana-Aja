import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import '../../../di/registered_injection.dart';
import '../../model/user_model.dart';

typedef SupabaseClient = supabase.SupabaseClient;
typedef OAuthProvider = supabase.OAuthProvider;

abstract class SignInRemoteDataSource {
  Future<UserCredential> signInWithGoogle();
  Future<void> registerUser({required UserModel user});
}

class SignInRemoteDataSourceImpl implements SignInRemoteDataSource {
  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      await GoogleSignIn().signOut();
      rethrow;
    }
  }

  @override
  Future<void> registerUser({required UserModel user}) async {
    try {
      await sl<SupabaseClient>().rpc('insert_user', params: user.toMap());
    } catch (e) {
      await GoogleSignIn().signOut();
      rethrow;
    }
  }
}
