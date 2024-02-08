import '../../../domain/entities/chapter_entity.dart';
import 'content_focus_key_display_model.dart';

class ChapterDisplayModel {
  const ChapterDisplayModel(
      {this.id = 0,
      this.courseId = 0,
      this.title = '',
      this.order = 0,
      this.createdAt,
      this.updatedAt,
      this.contentFocusKey = const []});

  final int id;
  final int courseId;
  final String title;
  final int order;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ContentFocusKeyDisplayModel> contentFocusKey;

  factory ChapterDisplayModel.fromEntity(ChapterEntity entity) =>
      ChapterDisplayModel(
          courseId: entity.courseId,
          createdAt: entity.createdAt,
          id: entity.id,
          order: entity.order,
          title: entity.title,
          updatedAt: entity.updatedAt,
          contentFocusKey: entity.contentFocusKey
              .map((focusKey) =>
                  ContentFocusKeyDisplayModel.fromEntity(focusKey))
              .toList());
}
