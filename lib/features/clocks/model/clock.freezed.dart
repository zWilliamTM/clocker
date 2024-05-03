// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Clock _$ClockFromJson(Map<String, dynamic> json) {
  return _Clock.fromJson(json);
}

/// @nodoc
mixin _$Clock {
  int get timestamp => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get createAt => throw _privateConstructorUsedError;
  @TagListConverter()
  List<Tag> get tags => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClockCopyWith<Clock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClockCopyWith<$Res> {
  factory $ClockCopyWith(Clock value, $Res Function(Clock) then) =
      _$ClockCopyWithImpl<$Res, Clock>;
  @useResult
  $Res call(
      {int timestamp,
      @DateTimeConverter() DateTime createAt,
      @TagListConverter() List<Tag> tags,
      String? title,
      String? description});
}

/// @nodoc
class _$ClockCopyWithImpl<$Res, $Val extends Clock>
    implements $ClockCopyWith<$Res> {
  _$ClockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? createAt = null,
    Object? tags = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClockImplCopyWith<$Res> implements $ClockCopyWith<$Res> {
  factory _$$ClockImplCopyWith(
          _$ClockImpl value, $Res Function(_$ClockImpl) then) =
      __$$ClockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int timestamp,
      @DateTimeConverter() DateTime createAt,
      @TagListConverter() List<Tag> tags,
      String? title,
      String? description});
}

/// @nodoc
class __$$ClockImplCopyWithImpl<$Res>
    extends _$ClockCopyWithImpl<$Res, _$ClockImpl>
    implements _$$ClockImplCopyWith<$Res> {
  __$$ClockImplCopyWithImpl(
      _$ClockImpl _value, $Res Function(_$ClockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timestamp = null,
    Object? createAt = null,
    Object? tags = null,
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_$ClockImpl(
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClockImpl implements _Clock {
  _$ClockImpl(
      {required this.timestamp,
      @DateTimeConverter() required this.createAt,
      @TagListConverter() required final List<Tag> tags,
      this.title,
      this.description})
      : _tags = tags;

  factory _$ClockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClockImplFromJson(json);

  @override
  final int timestamp;
  @override
  @DateTimeConverter()
  final DateTime createAt;
  final List<Tag> _tags;
  @override
  @TagListConverter()
  List<Tag> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? title;
  @override
  final String? description;

  @override
  String toString() {
    return 'Clock(timestamp: $timestamp, createAt: $createAt, tags: $tags, title: $title, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClockImpl &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, timestamp, createAt,
      const DeepCollectionEquality().hash(_tags), title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ClockImplCopyWith<_$ClockImpl> get copyWith =>
      __$$ClockImplCopyWithImpl<_$ClockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClockImplToJson(
      this,
    );
  }
}

abstract class _Clock implements Clock {
  factory _Clock(
      {required final int timestamp,
      @DateTimeConverter() required final DateTime createAt,
      @TagListConverter() required final List<Tag> tags,
      final String? title,
      final String? description}) = _$ClockImpl;

  factory _Clock.fromJson(Map<String, dynamic> json) = _$ClockImpl.fromJson;

  @override
  int get timestamp;
  @override
  @DateTimeConverter()
  DateTime get createAt;
  @override
  @TagListConverter()
  List<Tag> get tags;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$ClockImplCopyWith<_$ClockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
