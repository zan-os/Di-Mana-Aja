// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'content_focus_key_model.dart';

class ChapterModel {
  ChapterModel({
    this.id = 0,
    this.courseId = 0,
    this.title = '',
    this.order = 0,
    this.createdAt,
    this.updatedAt,
    this.contentFocusKey = const [],
  });

  final int id;
  final int courseId;
  final String title;
  final int order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ContentFocusKeyModel> contentFocusKey;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'courseId': courseId,
      'title': title,
      'order': order,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'content_focus_key': contentFocusKey.map((x) => x.toMap()).toList(),
    };
  }

  factory ChapterModel.fromMap(Map<String, dynamic> map) {
    return ChapterModel(
      id: (map['id'] ?? 0) as int,
      courseId: (map['courseId'] ?? 0) as int,
      title: (map['title'] ?? '') as String,
      order: (map['order'] ?? 0) as int,
      createdAt:
          map['created_at'] != null ? DateTime.parse(map['created_at']) : null,
      updatedAt:
          map['updated_at'] != null ? DateTime.parse(map['updated_at']) : null,
      contentFocusKey: List<ContentFocusKeyModel>.from(
        (map['content_focus_key']).map<ContentFocusKeyModel>(
          (x) => ContentFocusKeyModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChapterModel.fromJson(String source) =>
      ChapterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
