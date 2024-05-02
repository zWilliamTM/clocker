import 'package:clocker/features/clocks/model/clock.dart';
import 'package:clocker/features/clocks/provider/clocks.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'by_tag.g.dart';

@riverpod
class ByTag extends _$ByTag {
  @override
  Future<List<Clock>> build() async {
    return [];
  }

  void selectTag(Tag tag) {
    final clocks = ref.read(clocksProvider).asData?.value ?? [];

    if (clocks.isEmpty) {
      return;
    }

    final filtered = clocks.where((c) => c.tags.contains(tag)).toList();

    state = AsyncData(filtered);
  }
}
