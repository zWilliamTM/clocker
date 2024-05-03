import 'package:clocker/features/clocks/provider/clocks.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_clocks_bytags.g.dart';

@riverpod
List<Tag> filterClockByTags(FilterClockByTagsRef ref) {
  final clocks = ref.read(clocksProvider).asData?.value ?? [];

  if (clocks.isNotEmpty) {
    final tags = clocks.map((e) => e.tags).toList();
    final flatTags = tags.expand((element) => element).toList();
    return {...flatTags}.toList();
  }

  return [];
}
