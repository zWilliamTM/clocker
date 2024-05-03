import 'package:clocker/config/constants.dart';
import 'package:clocker/features/clocks/widget/clock_list_view.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/widget/tag_section_view.dart';
import 'package:clocker/features/telemetry/provider/by_tag.dart';
import 'package:clocker/features/telemetry/provider/filter_clocks_bytags.dart';
import 'package:clocker/widgets/background_layout_view.dart';
import 'package:clocker/widgets/section_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TagsTrackingPage extends ConsumerWidget {
  const TagsTrackingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tags = ref.watch(filterClockByTagsProvider);
    final clocks = ref.watch(byTagProvider).asData?.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tracking by tags'),
        backgroundColor: Colors.cyan,
      ),
      body: BackgroundLayoutView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TagSectionView(
                    tags: tags,
                    onPressed: (Tag tag) {
                      ref.read(byTagProvider.notifier).selectTag(tag);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ClockListView(clocks: clocks),
            ),
          ],
        ),
      ),
    );
  }
}
