import 'package:clocker/features/clocks/model/clock.dart';
import 'package:clocker/features/clocks/provider/clocks.dart';
import 'package:clocker/features/clocks/widget/clock_controll.dart';
import 'package:clocker/features/clocks/widget/clock_list_view.dart';
import 'package:clocker/features/telemetry/page/tags_tracking_page.dart';
import 'package:clocker/widgets/background_layout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockerMainPage extends ConsumerWidget {
  const ClockerMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockList = ref.watch(clocksProvider).asData?.value ?? [];

    return Scaffold(
      floatingActionButton: gotoTelemetry(context),
      body: BackgroundLayoutView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClockControll(
              onStop: _onStop(ref),
            ),
            Expanded(
              child: ClockListView(clocks: clockList),
            )
          ],
        ),
      ),
    );
  }

  FloatingActionButton gotoTelemetry(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TagsTrackingPage(),
          ),
        );
      },
      child: const Icon(Icons.auto_graph),
    );
  }

  Function(int) _onStop(WidgetRef ref) {
    return (int timestamp) {
      ref.read(clocksProvider.notifier).addClock(
            Clock(
              timestamp: timestamp,
              createAt: DateTime.now(),
              tags: [],
            ),
          );
    };
  }
}
