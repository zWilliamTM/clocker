import 'package:clocker/features/daily/model/clock.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_clock.g.dart';

@riverpod
class SelectedClock extends _$SelectedClock {
  Clock? _selected;

  @override
  Clock? build() {
    return _selected;
  }

  Future<void> select(Clock clock) async {
    _selected = clock;
    ref.notifyListeners();
  }

  Future<void> unselect() async {
    _selected = null;
    ref.notifyListeners();
  }
}
