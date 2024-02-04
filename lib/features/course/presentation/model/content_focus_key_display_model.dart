import 'package:di_mana_aja/features/course/domain/entities/content_focust_key_entity.dart';

class ContentFocusKeyDisplayModel {
  const ContentFocusKeyDisplayModel({
    this.focusKey = '',
  });

  final String focusKey;

  factory ContentFocusKeyDisplayModel.fromEntity(
          ContentFocusKeyEntity entity) =>
      ContentFocusKeyDisplayModel(focusKey: entity.focusKey);
}
