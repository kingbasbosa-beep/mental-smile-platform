import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:mental_smile_os/features/library/knowledge_cards/domain/models/knowledge_card.dart';
import 'package:mental_smile_os/shared/utils/asset_path_utils.dart';

abstract class KnowledgeCardRepository {
  Future<List<KnowledgeCard>> loadCards();

  Future<KnowledgeCard?> findById(String id);

  Future<String> loadMarkdown({
    required KnowledgeCard card,
    required KnowledgeArticleTab tab,
  });
}

class AssetKnowledgeCardRepository implements KnowledgeCardRepository {
  AssetKnowledgeCardRepository({
    AssetBundle? bundle,
    this.contentRoot = 'assets/content/library/know_your_right',
    this.imageRoot = 'assets/images/library/know_your_right/cards',
  }) : _bundle = bundle ?? rootBundle;

  final AssetBundle _bundle;
  final String contentRoot;
  final String imageRoot;

  List<KnowledgeCard>? _cache;

  @override
  Future<List<KnowledgeCard>> loadCards() async {
    if (_cache != null) return _cache!;

    final manifest = await AssetManifest.loadFromAssetBundle(_bundle);
    final metadataPaths = manifest
        .listAssets()
        .where(
          (path) =>
              path.startsWith('$contentRoot/') &&
              path.endsWith('/metadata.json'),
        )
        .toList()
      ..sort(_compareCardMetadataPaths);

    final cards = <KnowledgeCard>[];
    for (final path in metadataPaths) {
      final raw = await _bundle.loadString(path);
      final json = jsonDecode(raw);
      if (json is! Map<String, dynamic>) continue;
      cards.add(_cardFromJson(json, path));
    }

    _cache = List<KnowledgeCard>.unmodifiable(cards);
    return _cache!;
  }

  @override
  Future<KnowledgeCard?> findById(String id) async {
    final normalizedId = id.trim();
    if (normalizedId.isEmpty) return null;

    final cards = await loadCards();
    for (final card in cards) {
      if (card.id == normalizedId) return card;
    }
    return null;
  }

  @override
  Future<String> loadMarkdown({
    required KnowledgeCard card,
    required KnowledgeArticleTab tab,
  }) {
    final path = '$contentRoot/${card.folderName}/${tab.fileName}';
    return _bundle.loadString(path);
  }

  KnowledgeCard _cardFromJson(Map<String, dynamic> json, String metadataPath) {
    final folderName = _stringValue(json['folderName']).isNotEmpty
        ? _stringValue(json['folderName'])
        : _folderNameFromMetadataPath(metadataPath);
    final image = _stringValue(json['image']);

    return KnowledgeCard(
      id: _stringValue(json['id']).isNotEmpty
          ? _stringValue(json['id'])
          : folderName,
      title: _stringValue(json['title']).isNotEmpty
          ? _stringValue(json['title'])
          : 'Coming Soon',
      imagePath: image.isEmpty ? '' : normalizeAssetPath('$imageRoot/$image'),
      folderName: folderName,
      enabled: json['enabled'] == true,
      future: json['future'] == true,
      tags: _stringList(json['tags']),
      estimatedReadMinutes:
          _intValue(json['estimatedReadMinutes'] ?? json['readingMinutes']),
      difficulty: _stringValue(json['difficulty']),
    );
  }

  String _folderNameFromMetadataPath(String path) {
    final normalized = path.replaceAll('\\', '/');
    final parts = normalized.split('/');
    if (parts.length < 2) return '';
    return parts[parts.length - 2];
  }
}

int _compareCardMetadataPaths(String left, String right) {
  if (left.contains('/why_me_addicted/')) return -1;
  if (right.contains('/why_me_addicted/')) return 1;
  return left.compareTo(right);
}

String _stringValue(Object? value) => value?.toString().trim() ?? '';

int _intValue(Object? value) {
  if (value is int) return value;
  return int.tryParse(value?.toString() ?? '') ?? 0;
}

List<String> _stringList(Object? value) {
  if (value is! List) return const <String>[];
  return value
      .map((item) => item.toString().trim())
      .where((item) => item.isNotEmpty)
      .toList(growable: false);
}
