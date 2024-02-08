import 'package:di_mana_aja/domain/usecase/get_course_detail.dart';
import 'package:di_mana_aja/presentation/model/course_display_model.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecase/get_chapters.dart';
import '../../../model/chapter_display_model.dart';
import 'course_state.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit(
      {required GetChapters getChapters,
      required GetCourseDetail getCourseDetail})
      : _getChapters = getChapters,
        _getCourseDetail = getCourseDetail,
        super(const CourseState());

  final GetChapters _getChapters;
  final GetCourseDetail _getCourseDetail;

  void init() async {
    _setToLoadingState(true);
    await getCourse();
    await getChapters();

    _setToLoadingState(false);
  }

  void _setToLoadingState(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void _setToErrorState() {
    emit(CourseErrorState());
  }

  setCourseId({required int courseId}) {
    emit(state.copyWith(selectedCourseId: courseId));
  }

  Future<void> getCourse({int? courseId}) async {
    try {
      final response =
          await _getCourseDetail.call(courseId ?? state.selectedCourseId);
      final courseDisplayModel = CourseDisplayModel.toModel(response);

      emit(state.copyWith(selectedCourse: courseDisplayModel));
    } catch (error, stackTrace) {
      _setToErrorState();
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'User is trying to getCourse',
        // information: ['this is just a test', 'version 1.0'],
        fatal: true,
        printDetails: true,
      );
      emit(CourseErrorState());
    }
  }

  Future<void> getChapters({int? courseId}) async {
    try {
      final response =
          await _getChapters.call(courseId ?? state.selectedCourseId);
      final chapterDisplayModel = response
          .map((chapter) => ChapterDisplayModel.fromEntity(chapter))
          .toList();

      emit(state.copyWith(chapterList: chapterDisplayModel));
    } catch (error, stackTrace) {
      _setToErrorState();
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'User is trying to getChapters',
        // information: ['this is just a test', 'version 1.0'],
        fatal: true,
        printDetails: true,
      );
      emit(CourseErrorState());
    }
  }

  // TODO: Will be used in the future
  Future<ChapterDisplayModel> selectChapter() async {
    try {
      final selectedChapter = state.chapterList
          .firstWhere((courseId) => courseId.id == state.selectedCourseId);

      emit(state.copyWith(selectedChapter: selectedChapter));

      return selectedChapter;
    } catch (error, stackTrace) {
      _setToErrorState();
      FirebaseCrashlytics.instance.recordError(
        error,
        stackTrace,
        reason: 'Error when selecting chapter',
        // information: ['this is just a test', 'version 1.0'],
        fatal: true,
        printDetails: true,
      );
      emit(CourseErrorState());
      throw Error();
    }
  }
}
