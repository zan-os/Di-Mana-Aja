import 'package:get_it/get_it.dart';

import 'core/di/core_injection.dart';
import 'di/course_injection.dart';
import 'di/home_injection.dart';
import 'di/sign_in_injection.dart';
import 'di/splash_injection.dart';

final sl = GetIt.instance;

class RegisteredInjection {
  static Future<void> init() async {
    _registerCoreInjection();
    _registerSignInInjection();
    _registerSplashInjection();
    _registerHomeInjection();
    _registerCourseInjection();
  }

  static void _registerCoreInjection() {
    CoreInjection();
  }

  static void _registerSignInInjection() {
    SignInInjection();
  }

  static void _registerSplashInjection() {
    SplashScreenInjection();
  }

  static void _registerHomeInjection() {
    HomeInjection();
  }

  static void _registerCourseInjection() {
    CourseInjection();
  }
}
