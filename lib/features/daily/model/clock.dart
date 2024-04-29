import 'package:clocker/features/tag/model/tag.dart';

class Clock {
  final int timestamp;
  final DateTime createAt;
  final List<Tag> tags;

  Clock({required this.timestamp, required this.createAt, required this.tags});
}
