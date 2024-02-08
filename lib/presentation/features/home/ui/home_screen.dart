import 'package:di_mana_aja/config/route_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/home_cubit.dart';
import '../bloc/home_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await GoogleSignIn().signOut();
                await FirebaseAuth.instance.signOut();
                if (context.mounted) {
                  context.pushReplacement(RouteConfig.splash.path);
                }
              },
              child: const Text('Logout'),
            ),
            const Gap(10),
            BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current.courses != previous.courses,
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  addAutomaticKeepAlives: true,
                  itemCount: state.courses.length,
                  itemBuilder: (context, index) {
                    final course = state.courses[index];
                    return InkWell(
                      onTap: () => context.push(RouteConfig.course.path,
                          extra: course.id),
                      child: Text(course.title),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
