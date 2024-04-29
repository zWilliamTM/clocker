import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'clock_list.g.dart';

@riverpod
class ClockList extends _$ClockList {
  @override
  Future<List<Clock>> build() async {
    return [
      Clock(
        timestamp: 0,
        createAt: DateTime.now(),
        tags: [
          Tag(name: 'dev', color: Colors.green),
        ],
      )
    ];
  }

  Future<void> addClock(Clock clock) async {
    final previousState = await future;
    state = AsyncData([clock, ...previousState]);
  }

  Future<void> removeClock(Clock clock) async {
    final previousState = await future;
    state = AsyncData(previousState
        .where((c) => c.createAt.toString() != clock.createAt.toString())
        .toList());
  }

  Future<void> updateClock(Clock clock) async {
    final previousState = await future;
    state = AsyncData(previousState
        .map((c) =>
            c.createAt.toString() == clock.createAt.toString() ? clock : c)
        .toList());
  }
}
