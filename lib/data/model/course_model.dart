// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/course_entity.dart';

class CourseModel {
  const CourseModel({
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: (map['id'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CourseModel.toEntity(CourseEntity entity) => CourseModel(
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        description: entity.description,
        id: entity.id,
        title: entity.title,
      );
}
