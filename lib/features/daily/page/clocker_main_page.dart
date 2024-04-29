import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/features/daily/provider/clock_list.dart';
import 'package:clocker/features/daily/widget/clock_controll.dart';
import 'package:clocker/features/daily/widget/clock_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ClockerMainPage extends ConsumerWidget {
  const ClockerMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clockList = ref.watch(clockListProvider).asData?.value ?? [];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.cyan,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClockControll(
                onStop: _onStop(ref),
              ),
              const Divider(),
              Expanded(
                child: ClockListView(clocks: clockList),
              )
            ],
          ),
        ),
      ),
    );
  }

  Function(int) _onStop(WidgetRef ref) {
    return (int timestamp) {
      ref.read(clockListProvider.notifier).addClock(
            Clock(
              timestamp: timestamp,
              createAt: DateTime.now(),
              tags: [],
            ),
          );
    };
  }
}
