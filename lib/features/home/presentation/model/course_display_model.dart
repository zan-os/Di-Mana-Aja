import 'package:di_mana_aja/features/home/domain/entities/course_entity.dart';

class CourseDisplayModel {
  const CourseDisplayModel({
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

  factory CourseDisplayModel.toModel(CourseEntity entity) => CourseDisplayModel(
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        description: entity.description,
        id: entity.id,
        title: entity.title,
      );
}
