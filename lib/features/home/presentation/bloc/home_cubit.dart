import 'package:di_mana_aja/core/usecase/base_usecase.dart';
import 'package:di_mana_aja/features/home/domain/usecase/get_course.dart';
import 'package:di_mana_aja/features/home/presentation/model/course_display_model.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required GetCourses getCourse})
      : _getCourse = getCourse,
        super(const HomeState());

  final GetCourses _getCourse;

  Future<void> getCourse() async {
    try {
      final coursesEntity = await _getCourse.call(NoParams());
      final courseModel = coursesEntity
          .map(
            (course) => CourseDisplayModel.toModel(course),
          )
          .toList();
      emit(state.copyWith(courses: courseModel));
    } catch (error, stackTrace) {
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
