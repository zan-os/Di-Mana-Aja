// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../domain/entities/course_entity.dart';

class CourseModel {
  CourseModel({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.imageUrl = '',
    this.level = '',
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'level': level,
      'total_rating': totalRating,
      'average_rating': averageRating,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      id: (map['id'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      imageUrl: (map['image_url'] ?? '') as String,
      level: (map['level'] ?? '') as String,
      totalRating: (map['total_rating'] ?? 0) as int,
      averageRating: (map['average_rating'] ?? 0.0) as double,
      createdAt: (map['created_at'] != null)
          ? DateTime.parse(map['created_at'])
          : null,
      updatedAt: (map['updated_at'] != null)
          ? DateTime.parse(map['updated_at'])
          : null,
    );
  }

  factory CourseModel.fromJson(String source) =>
      CourseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory CourseModel.toEntity(CourseEntity entity) => CourseModel(
        createdAt: entity.createdAt,
        updatedAt: entity.updatedAt,
        description: entity.description,
        id: entity.id,
        level: entity.level,
        averageRating: entity.averageRating,
        totalRating: entity.totalRating,
        imageUrl: entity.imageUrl,
        title: entity.title,
      );

  CourseModel copyWith({
    int? id,
    String? title,
    String? description,
    String? imageUrl,
    String? level,
    int? totalRating,
    double? averageRating,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return CourseModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      level: level ?? this.level,
      totalRating: totalRating ?? this.totalRating,
      averageRating: averageRating ?? this.averageRating,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'CourseModel(id: $id, title: $title, description: $description, imageUrl: $imageUrl, level: $level, total_rating: $totalRating, average_rating: $averageRating, created_at: $createdAt, updated_at: $updatedAt)';
  }

  @override
  bool operator ==(covariant CourseModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.level == level &&
        other.totalRating == totalRating &&
        other.averageRating == averageRating &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        imageUrl.hashCode ^
        level.hashCode ^
        totalRating.hashCode ^
        averageRating.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
