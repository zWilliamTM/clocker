import 'package:clocker/features/tag/model/tag.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'defualt_tag.g.dart';

@riverpod
class DefaultTag extends _$DefaultTag {
  @override
  Future<List<Tag>> build() async {
    return [
      Tag(name: 'dev', color: Colors.green),
      Tag(name: 'stuff', color: Colors.red),
      Tag(name: 'random', color: Colors.blue),
    ];
  }
}
