import 'dart:convert';
import 'package:personal_hub_app/data/database/app_database.dart';
import 'package:personal_hub_app/domain/entities/emotion_explorer_map_entity.dart';

extension EmotionExplorerMapMapper on EmotionExplorerMap {
  EmotionExplorerMapEntity toEntity() {
    final rawMap = data.isNotEmpty
        ? (jsonDecode(data) as Map<String, dynamic>)
        : <String, dynamic>{};
    return EmotionExplorerMapEntity(
      rawMap.map((k, v) => MapEntry(k, v.toString()))
    );
  }
}

extension EmotionExplorerMapEntityMapper on EmotionExplorerMapEntity {
  String toJson() {
    return jsonEncode(map);
  }
}

