import 'package:di_mana_aja/presentation/model/course_display_model.dart';
import 'package:equatable/equatable.dart';

import '../../../model/chapter_display_model.dart';

class CourseState extends Equatable {
  const CourseState({
    this.chapterList = const [],
    this.selectedChapter = const ChapterDisplayModel(),
    this.selectedCourse = const CourseDisplayModel(),
    this.selectedCourseId = 0,
    this.isLoading = false,
  });

  final List<ChapterDisplayModel> chapterList;
  final ChapterDisplayModel selectedChapter;
  final CourseDisplayModel selectedCourse;
  final int selectedCourseId;
  final bool isLoading;

  CourseState copyWith({
    List<ChapterDisplayModel>? chapterList,
    ChapterDisplayModel? selectedChapter,
    CourseDisplayModel? selectedCourse,
    int? selectedCourseId,
    bool? isLoading,
  }) {
    return CourseState(
      chapterList: chapterList ?? this.chapterList,
      selectedChapter: selectedChapter ?? this.selectedChapter,
      selectedCourse: selectedCourse ?? this.selectedCourse,
      selectedCourseId: selectedCourseId ?? this.selectedCourseId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props {
    return [
      chapterList,
      selectedChapter,
      selectedCourse,
      selectedCourseId,
      isLoading,
    ];
  }
}

class CourseLoadingState extends CourseState {}

class CourseErrorState extends CourseState {}
