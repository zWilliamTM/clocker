// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClockImpl _$$ClockImplFromJson(Map<String, dynamic> json) => _$ClockImpl(
      timestamp: (json['timestamp'] as num).toInt(),
      createAt: const DateTimeConverter().fromJson(json['createAt'] as String),
      tags: const TagListConverter()
          .fromJson(json['tags'] as List<Map<dynamic, dynamic>>),
    );

Map<String, dynamic> _$$ClockImplToJson(_$ClockImpl instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'createAt': const DateTimeConverter().toJson(instance.createAt),
      'tags': const TagListConverter().toJson(instance.tags),
    };
