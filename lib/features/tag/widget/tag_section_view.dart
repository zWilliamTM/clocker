import 'package:clocker/features/daily/widget/box_styled.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/widget/tag_view.dart';
import 'package:flutter/material.dart';

class TagSectionView extends StatelessWidget {
  const TagSectionView({
    super.key,
    required this.sectionName,
    required this.tags,
    required this.onPressed,
  });

  final String sectionName;
  final List<Tag> tags;
  final Function(Tag) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionName,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
        BoxStyled(
          hPadding: 0,
          vPadding: 0,
          child: SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 10,
              children: [
                for (final tag in tags)
                  PressableTagView(
                    tag: tag,
                    onPressed: onPressed,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
