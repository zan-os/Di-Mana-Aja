import 'package:di_mana_aja/features/course/domain/usecase/get_chapters.dart';
import 'package:di_mana_aja/features/course/presentation/bloc/course_state.dart';
import 'package:di_mana_aja/features/course/presentation/model/course_display_model.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseCubit extends Cubit<CourseState> {
  CourseCubit({required GetChapters getChapters})
      : _getChapters = getChapters,
        super(const CourseState());

  final GetChapters _getChapters;

  void init({required int courseId}) async {
    _setToLoadingState();
    await setCourseId(courseId: courseId);
    await getChapters();
    selectChapter();
  }

  void _setToLoadingState() {
    emit(CourseLoadingState());
  }

  void _setToErrorState() {
    emit(CourseErrorState());
  }

  Future<void> setCourseId({required int courseId}) async {
    emit(state.copyWith(selectedCourseId: courseId));
  }

  Future<void> getChapters() async {
    try {
      final response = await _getChapters.call(state.selectedCourseId);
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
    }
  }

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
      throw Error();
    }
  }
}
