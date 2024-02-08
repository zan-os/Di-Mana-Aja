// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:di_mana_aja/data/model/course_model.dart';

class CourseEntity {
  const CourseEntity({
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

  factory CourseEntity.toEntity(CourseModel model) => CourseEntity(
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        description: model.description,
        imageUrl: model.imageUrl,
        level: model.level,
        averageRating: model.averageRating,
        totalRating: model.totalRating,
        id: model.id,
        title: model.title,
      );
}
