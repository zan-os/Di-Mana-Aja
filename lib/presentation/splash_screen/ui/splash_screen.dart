import 'package:di_mana_aja/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listenWhen: (previous, current) =>
            current == previous || current != previous,
        listener: (context, state) {
          if (state is AuthenticatedState) {
            context.replace(RouteConfig.home.path);
          } else {
            context.replace(RouteConfig.signin.path);
          }
        },
        child: const Center(
          child: Text('Splash Screen'),
        ),
      ),
    );
  }
}
