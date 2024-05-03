import 'package:clocker/features/tag/model/tag.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clock.freezed.dart';
part 'clock.g.dart';

class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  @override
  String toJson(DateTime object) => object.toIso8601String();
}

class TagListConverter implements JsonConverter<List<Tag>, List<Map>> {
  const TagListConverter();

  @override
  List<Tag> fromJson(List<Map> json) =>
      json.map((e) => Tag.fromJson(e)).toList();

  @override
  List<Map> toJson(List<Tag> object) => object.map((e) => e.toJson()).toList();
}

@freezed
class Clock with _$Clock {
  factory Clock({
    required int timestamp,
    @DateTimeConverter() required DateTime createAt,
    @TagListConverter() required List<Tag> tags,
    String? title,
    String? description,
  }) = _Clock;

  factory Clock.fromJson(Map json) => Clock(
        timestamp: json['timestamp'] as int,
        createAt: DateTime.parse(json['createAt'] as String),
        tags: (json['tags'] as List).map((e) => Tag.fromJson(e)).toList(),
        title: json['title'] as String? ?? '',
        description: json['description'] as String? ?? '',
      );
}
