import 'package:clocker/storage/hive_storage.dart';
import 'package:clocker/storage/persistent_data_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model/tag.dart';

part 'tags.g.dart';

@Riverpod(keepAlive: true)
class Tags extends _$Tags implements IPersistentData<List<Tag>> {
  late Box _box;
  bool _isInitialized = false;

  @override
  Future<List<Tag>> build() async {
    if (!_isInitialized) {
      _box = await ref.read(hiveStorageProvider)(BoxField.tags);
      _isInitialized = true;
      await loadData();
    }

    List<Tag> data = state.asData?.value ?? [];

    return data;
  }

  Future<void> addTag(Tag tag) async {
    final previousState = await future;
    final newState = [...previousState, tag];
    state = AsyncData(newState);
    saveData(newState);
  }

  @override
  Future<void> loadData({String? key}) async {
    final data = _box.get('0') ?? [];
    final result = (data as List).map((e) => Tag.fromJson(e)).toList();
    state = AsyncData(result);
  }

  @override
  void saveData(List<Tag> value, {String? key}) async {
    await _box.put('0', value.map((e) => e.toJson()).toList());
  }
}
