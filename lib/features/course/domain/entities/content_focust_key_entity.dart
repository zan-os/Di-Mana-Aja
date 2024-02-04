import 'package:di_mana_aja/features/course/data/model/content_focus_key_model.dart';

class ContentFocusKeyEntity {
  ContentFocusKeyEntity({
    this.focusKey = '',
  });

  final String focusKey;

  factory ContentFocusKeyEntity.fromModel(ContentFocusKeyModel model) =>
      ContentFocusKeyEntity(focusKey: model.focusKey);
}
