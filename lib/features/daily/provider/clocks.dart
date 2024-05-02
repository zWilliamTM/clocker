import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/storage/hive_storage.dart';
import 'package:clocker/storage/persistent_data_interface.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clocks.g.dart';

@riverpod
class Clocks extends _$Clocks implements IPersistentData<List<Clock>> {
  late Box _box;
  bool _isInitialized = false;

  @override
  Future<List<Clock>> build() async {
    if (!_isInitialized) {
      _box = await ref.read(hiveStorageProvider)(BoxField.clocks);
      _isInitialized = true;
      await loadData();
    }

    List<Clock> data = state.asData?.value ?? [];

    return data;
  }

  Future<void> addClock(Clock clock) async {
    final previousState = await future;
    final newState = [clock, ...previousState];
    state = AsyncData(newState);
    saveData(newState);
  }

  Future<void> removeClock(Clock clock) async {
    final previousState = await future;
    final newState = previousState
        .where((c) => c.createAt.toString() != clock.createAt.toString())
        .toList();
    state = AsyncData(newState);
    saveData(newState);
  }

  Future<void> updateClock(Clock clock) async {
    final previousState = await future;

    final newState = previousState
        .map((c) =>
            c.createAt.toString() == clock.createAt.toString() ? clock : c)
        .toList();

    state = AsyncData(newState);
    saveData(newState);
  }

  @override
  Future<void> loadData({String? key}) async {
    final data = _box.get('0') ?? [];
    final result = (data as List).map((e) => Clock.fromJson(e)).toList();
    state = AsyncData(result);
  }

  @override
  void saveData(List<Clock> value, {String? key}) async {
    await _box.put('0', value.map((e) => e.toJson()).toList());
  }
}
