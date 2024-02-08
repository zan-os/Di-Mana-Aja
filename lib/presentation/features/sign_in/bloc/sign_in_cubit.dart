import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../../domain/usecase/sign_in_with_google.dart';
import 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required SignInWithGoogle signInWithGoogle})
      : _signInWithGoogle = signInWithGoogle,
        super(const SignInState());

  final SignInWithGoogle _signInWithGoogle;

  Future<void> signInWithGoogle() async {
    try {
      final UserCredential response = await _signInWithGoogle.call(NoParams());

      if (response.credential == null) {
        emit(SignInFailedState());
      } else {
        emit(SignInSuccessState());
      }
    } catch (error, stackTrace) {
      emit(SignInFailedState());
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'User is trying to sign in using Google SSO',
        // information: ['this is just a test', 'version 1.0'],
        fatal: true,
        printDetails: true,
      );
      throw Error();
    }
  }
}
