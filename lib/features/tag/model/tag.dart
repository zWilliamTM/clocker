import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.g.dart';
part 'tag.freezed.dart';

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}

@freezed
class Tag with _$Tag {
  const factory Tag({
    required String name,
    @ColorConverter() required Color color,
  }) = _Tag;

  factory Tag.fromJson(Map json) => Tag(
        name: json['name'] as String,
        color: Color(json['color'] as int),
      );
}
