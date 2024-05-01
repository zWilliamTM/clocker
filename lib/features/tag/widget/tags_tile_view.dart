import 'package:clocker/config/constants.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/widget/tag_view.dart';
import 'package:clocker/utils/color_extension.dart';
import 'package:flutter/material.dart';

class TagsTileView extends StatelessWidget {
  const TagsTileView({
    super.key,
    required this.tags,
  });

  final List<Tag> tags;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        color: Colors.black.defaultOpacity,
        borderRadius: BorderRadius.circular(kRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (final tag in tags)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: TagView(
                      tag: tag,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
