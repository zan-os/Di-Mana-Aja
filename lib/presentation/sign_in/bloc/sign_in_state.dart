// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SignInState extends Equatable {
  final bool isSuccess;

  const SignInState({
    this.isSuccess = false,
  });

  SignInState copyWith({
    bool? isSuccess,
  }) {
    return SignInState(
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }

  @override
  List<Object> get props => [isSuccess];
}

class SignInFailedState extends SignInState {}

class SignInSuccessState extends SignInState {}
