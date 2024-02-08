// Platform  Firebase App Id
// android   1:998538335462:android:1f00dd5c7ba9a066cad727
// ios       1:998538335462:ios:764e031f7124f43fcad727

import 'package:di_mana_aja/config/color_palette.dart';
import 'package:di_mana_aja/config/firebase_options.dart';
import 'package:di_mana_aja/config/route_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/constant_config.dart';
import 'di/registered_injection.dart';
import 'presentation/features/course/bloc/course_cubit.dart';
import 'presentation/features/course/ui/couse_screen.dart';
import 'presentation/features/home/bloc/home_cubit.dart';
import 'presentation/features/home/ui/home_screen.dart';
import 'presentation/features/sign_in/bloc/sign_in_cubit.dart';
import 'presentation/features/sign_in/ui/sign_in_screen.dart';
import 'presentation/features/splash_screen/bloc/splash_cubit.dart';
import 'presentation/features/splash_screen/ui/splash_screen.dart';

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: RouteConfig.splash.name,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (context) =>
              SplashCubit(checkCredential: sl())..checkCredential(),
          child: const SplashScreen(),
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: RouteConfig.signin.name,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => SignInCubit(signInWithGoogle: sl()),
              child: const SignInScreen(),
            );
          },
        ),
        GoRoute(
          path: RouteConfig.home.name,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => HomeCubit(getCourse: sl())..getCourse(),
              child: const HomeScreen(),
            );
          },
        ),
        GoRoute(
          path: RouteConfig.course.name,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) =>
                  CourseCubit(getChapters: sl(), getCourseDetail: sl())
                    ..setCourseId(courseId: state.extra as int)
                    ..init(),
              child: const CourseScreen(),
            );
          },
        ),
      ],
    ),
  ],
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load .env file
  dotenv.load(fileName: '.env');

  // Registering Service Locaton
  await RegisteredInjection.init();

  // Initializing Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Initializing Supabase
  final config = ConstantConfig();

  await Supabase.initialize(
    url: config.baseUrl,
    anonKey: config.apiKey,
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorPalette.darkBlue,
        primaryColor: ColorPalette.purple,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: ColorPalette.purple,
          secondary: ColorPalette.white,
          error: ColorPalette.red,
          onPrimary: ColorPalette.white,
          background: ColorPalette.darkBlue,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
              bodyColor: ColorPalette.white,
              displayColor: ColorPalette.white,
              decorationColor: ColorPalette.white,
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorPalette.darkBlue,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: ColorPalette.white,
            fontSize: 20,
          ),
          iconTheme: IconThemeData(color: ColorPalette.white),
          elevation: 0,
        ),
      ),
    );
  }
}
