import 'package:clocker/config/constants.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/widget/tag_view.dart';
import 'package:clocker/widgets/section_view.dart';
import 'package:flutter/material.dart';

class TagSectionView extends StatelessWidget {
  const TagSectionView({
    super.key,
    required this.tags,
    required this.onPressed,
    this.sectionName = '',
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
        if (sectionName.isNotEmpty)
          Text(
            sectionName,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.bold,
            ),
          ),
        SectionView(
          child: Wrap(
            spacing: kPadding,
            children: [
              for (final tag in tags)
                PressableTagView(
                  tag: tag,
                  onPressed: onPressed,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
