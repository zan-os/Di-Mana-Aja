import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/route_config.dart';
import '../bloc/sign_in_cubit.dart';
import '../bloc/sign_in_state.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInCubit>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              cubit.signInWithGoogle();
            },
            child: const Text('Sign in'),
          ),
          BlocListener<SignInCubit, SignInState>(
            listenWhen: (previous, current) => current != previous,
            listener: (context, state) {
              if (state is SignInSuccessState) {
                SnackBar(
                  content: const Text('Sign In Success!'),
                  backgroundColor: Colors.green.shade700,
                );
                context.pushReplacement(RouteConfig.home.path);
              }
            },
            child: const SizedBox.shrink(),
          )
          // const Gap(10),
          // ElevatedButton(
          //   onPressed: () {
          //     cubit.fetchData();
          //   },
          //   child: const Text('Fetch'),
          // ),
        ],
      ),
    );
  }
}
