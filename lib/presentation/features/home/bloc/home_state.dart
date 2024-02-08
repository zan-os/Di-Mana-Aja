// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../../model/course_display_model.dart';

class HomeState extends Equatable {
  final List<CourseDisplayModel> courses;

  const HomeState({
    this.courses = const [],
  });

  HomeState copyWith({
    List<CourseDisplayModel>? courses,
  }) {
    return HomeState(
      courses: courses ?? this.courses,
    );
  }

  @override
  List<Object> get props => [courses];
}
