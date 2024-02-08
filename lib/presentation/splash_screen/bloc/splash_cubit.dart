import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/domain/usecase/check_credential.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required CheckCredential checkCredential})
      : _checkCredential = checkCredential,
        super(const SplashState());

  final CheckCredential _checkCredential;

  void checkCredential() async {
    try {
      final bool isAunthenticated = await _checkCredential.call(NoParams());

      if (isAunthenticated) {
        emit(AuthenticatedState());
      } else {
        emit(UnauthenticatedState());
      }
    } catch (e) {
      emit(UnauthenticatedState());
    }
  }
}
