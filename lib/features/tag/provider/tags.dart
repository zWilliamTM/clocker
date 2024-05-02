import 'package:clocker/storage/hive_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/tag.dart';

part 'tags.g.dart';

@Riverpod(keepAlive: true)
class Tags extends _$Tags {
  late Box _box;
  bool _isInitialized = false;

  @override
  Future<List<Tag>> build() async {
    List<Tag> data = state is AsyncData ? (state as AsyncData).value : [];
    if (!_isInitialized) {
      _box = await ref.read(hiveStorageProvider)(BoxField.tags);
      _isInitialized = true;
      data = await loadData();
    }

    return data;
  }

  Future<void> addTag(Tag tag) async {
    final previousState = await future;
    final newState = [...previousState, tag];
    state = AsyncData(newState);
    saveData(newState);
  }

  Future<List<Tag>> loadData({String? key}) async {
    List data = _box.get('0') ?? [];
    final result = data.map((e) => Tag.fromJson(e)).toList();
    return result;
  }

  void saveData(List<Tag> value, {String? key}) async {
    await _box.put('0', value.map((e) => e.toJson()).toList());
  }
}
