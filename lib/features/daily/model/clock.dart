import 'package:clocker/features/tag/model/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock.freezed.dart';

@freezed
class Clock with _$Clock {
  factory Clock({
    required int timestamp,
    required DateTime createAt,
    required List<Tag> tags,
  }) = _Clock;
}
