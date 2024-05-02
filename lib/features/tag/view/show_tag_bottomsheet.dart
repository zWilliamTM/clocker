import 'dart:math';

import 'package:clocker/config/colors.dart';
import 'package:clocker/config/constants.dart';
import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/features/daily/provider/clocks.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/provider/tags.dart';
import 'package:clocker/features/tag/widget/tag_section_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Function() showTagBottomSheet(
    BuildContext context, WidgetRef ref, Clock clock) {
  return () {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return _Background(
          child: _Content(clock: clock),
        );
      },
    );
  };
}

class _Content extends ConsumerWidget {
  const _Content({super.key, required this.clock});

  final Clock clock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultTag = ref.watch(tagsProvider).asData?.value ?? [];
    final clockList = ref.watch(clocksProvider).asData?.value ?? [];
    final clockIndex =
        clockList.indexWhere((c) => c.createAt == clock.createAt);

    final currentClock = clockList[clockIndex];
    final currentTags = currentClock.tags;

    return Column(
      children: [
        _Input(
          onAppend: _onAppendText(ref),
        ),
        const SizedBox(height: kPadding),
        TagSectionView(
          sectionName: 'Selected',
          tags: currentTags,
          onPressed: _onPressedRemoveTag(ref, currentClock),
        ),
        TagSectionView(
          sectionName: 'Stored',
          tags: defaultTag,
          onPressed: _onPressedAddTag(ref, currentClock),
        )
      ],
    );
  }

  Function(String) _onAppendText(WidgetRef ref) {
    return (String tagName) {
      if (tagName.isNotEmpty) {
        ref
            .read(tagsProvider.notifier)
            .addTag(Tag(name: tagName, color: getRandomColor()));
      }
    };
  }

  Function(Tag) _onPressedAddTag(WidgetRef ref, Clock clock) {
    return (Tag tag) {
      ref.read(clocksProvider.notifier).updateClock(
            clock.copyWith(tags: {...clock.tags, tag}.toList()),
          );
    };
  }

  Function(Tag) _onPressedRemoveTag(WidgetRef ref, Clock clock) {
    return (Tag tag) {
      ref.read(clocksProvider.notifier).updateClock(
            clock.copyWith(
              tags: clock.tags.where((t) => t.name != tag.name).toList(),
            ),
          );
    };
  }
}

class _Input extends StatefulWidget {
  const _Input({super.key, required this.onAppend});

  final Function(String) onAppend;

  @override
  State<_Input> createState() => __InputState();
}

class __InputState extends State<_Input> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) {
              print('Submitted: $value');
            },
            decoration: const InputDecoration(
              hintText: 'Tag name',
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onAppend(_controller.text.trim());
            _controller.clear();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      padding: const EdgeInsets.all(kPadding),
      decoration: const BoxDecoration(
        color: kPrimary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadius),
          topRight: Radius.circular(kRadius),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}

Color getRandomColor() {
  final random = Random();
  return Color.fromRGBO(
    random.nextInt(256), // Red
    random.nextInt(256), // Green
    random.nextInt(256), // Blue
    1, // Alpha
  );
}
