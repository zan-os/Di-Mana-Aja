// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:di_mana_aja/features/course/presentation/model/course_display_model.dart';
import 'package:equatable/equatable.dart';

class CourseState extends Equatable {
  const CourseState({
    this.chapterList = const [],
    this.selectedChapter = const ChapterDisplayModel(),
    this.selectedCourseId = 0,
  });

  final List<ChapterDisplayModel> chapterList;
  final ChapterDisplayModel selectedChapter;
  final int selectedCourseId;

  CourseState copyWith({
    List<ChapterDisplayModel>? chapterList,
    ChapterDisplayModel? selectedChapter,
    int? selectedCourseId,
  }) {
    return CourseState(
      chapterList: chapterList ?? this.chapterList,
      selectedChapter: selectedChapter ?? this.selectedChapter,
      selectedCourseId: selectedCourseId ?? this.selectedCourseId,
    );
  }

  @override
  List<Object> get props => [chapterList, selectedChapter, selectedCourseId];
}

class CourseLoadingState extends CourseState {}

class CourseErrorState extends CourseState {}
