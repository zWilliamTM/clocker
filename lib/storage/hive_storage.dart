import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'hive_storage.g.dart';

enum BoxField {
  clocks,
  tags,
}

@Riverpod(keepAlive: true)
Future<Box> Function(BoxField) hiveStorage(HiveStorageRef ref) {
  var boxes = {
    BoxField.clocks: () => Hive.openBox(BoxField.clocks.toString()),
    BoxField.tags: () => Hive.openBox(BoxField.tags.toString()),
  };
  return (BoxField boxName) async {
    final box = await boxes[boxName]!();
    return box;
  };
}
