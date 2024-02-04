// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ContentFocusKeyModel {
  ContentFocusKeyModel({
    this.focusKey = '',
  });

  final String focusKey;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'focus_key': focusKey,
    };
  }

  factory ContentFocusKeyModel.fromMap(Map<String, dynamic> map) {
    return ContentFocusKeyModel(
      focusKey: (map['focus_key'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ContentFocusKeyModel.fromJson(String source) =>
      ContentFocusKeyModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
