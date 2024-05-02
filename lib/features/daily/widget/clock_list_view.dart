import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/features/daily/provider/clocks.dart';
import 'package:clocker/features/daily/utils/formats.dart';
import 'package:clocker/features/daily/widget/box_styled.dart';
import 'package:clocker/features/tag/view/show_tag_bottomsheet.dart';
import 'package:clocker/features/tag/widget/tags_tile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockListView extends ConsumerWidget {
  const ClockListView({super.key, required this.clocks});

  final List<Clock> clocks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BoxStyled(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          for (final clock in clocks)
            ListTile(
              title: Text(formatDateTime(clock.createAt)),
              subtitle: Text(formatDuration(clock.timestamp)),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TagsTileView(tags: clock.tags),
                  IconButton(
                    icon: const Icon(Icons.tag),
                    onPressed: showTagBottomSheet(context, ref, clock),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref.read(clocksProvider.notifier).removeClock(clock);
                    },
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}
