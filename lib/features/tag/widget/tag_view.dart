import 'package:clocker/features/tag/model/tag.dart';
import 'package:flutter/material.dart';

class TagView extends StatelessWidget {
  const TagView({
    super.key,
    required this.tag,
  });

  final Tag tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        color: tag.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        tag.name,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}

class PressableTagView extends StatelessWidget {
  const PressableTagView(
      {super.key, required this.tag, required this.onPressed});

  final Tag tag;
  final Function(Tag) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(tag),
      child: TagView(tag: tag),
    );
  }
}
