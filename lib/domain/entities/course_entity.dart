import 'package:di_mana_aja/data/model/course_model.dart';

class CourseEntity {
  const CourseEntity({
    this.id = 0,
    this.title = '',
    this.description = '',
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory CourseEntity.toEntity(CourseModel model) => CourseEntity(
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        description: model.description,
        id: model.id,
        title: model.title,
      );
}
