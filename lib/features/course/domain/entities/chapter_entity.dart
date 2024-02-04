// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:di_mana_aja/features/course/data/model/chapter_model.dart';
import 'package:di_mana_aja/features/course/domain/entities/content_focust_key_entity.dart';

class ChapterEntity {
  ChapterEntity({
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
  final List<ContentFocusKeyEntity> contentFocusKey;

  factory ChapterEntity.fromModel(ChapterModel model) => ChapterEntity(
      courseId: model.courseId,
      createdAt: model.createdAt,
      id: model.id,
      order: model.order,
      title: model.title,
      updatedAt: model.updatedAt,
      contentFocusKey: model.contentFocusKey
          .map((focusKey) => ContentFocusKeyEntity.fromModel(focusKey))
          .toList());
}
