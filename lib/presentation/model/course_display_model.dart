// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:di_mana_aja/domain/entities/course_entity.dart';

class CourseDisplayModel {
  const CourseDisplayModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.imageUrl = '',
    this.level = '0',
    this.totalRating = 0,
    this.averageRating = 0,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String level;
  final int totalRating;
  final double averageRating;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CourseDisplayModel.toModel(CourseEntity entity) => CourseDisplayModel(
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        description: entity.description,
        id: entity.id,
        level: entity.level,
        totalRating: entity.totalRating,
        averageRating: entity.averageRating,
        imageUrl: entity.imageUrl,
        title: entity.title,
      );
}
