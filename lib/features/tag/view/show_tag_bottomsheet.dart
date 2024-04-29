import 'package:clocker/features/daily/model/clock.dart';
import 'package:clocker/features/daily/provider/clock_list.dart';
import 'package:clocker/features/tag/model/tag.dart';
import 'package:clocker/features/tag/provider/defualt_tag.dart';
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
    final defaultTag = ref.watch(defaultTagProvider).asData?.value ?? [];
    final clockList = ref.watch(clockListProvider).asData?.value ?? [];
    final clockIndex =
        clockList.indexWhere((c) => c.createAt == clock.createAt);

    final currentClock = clockList[clockIndex];
    final currentTags = currentClock.tags;

    return Column(
      children: [
        const _Form(),
        const SizedBox(height: 20),
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

  Function(Tag) _onPressedAddTag(WidgetRef ref, Clock clock) {
    return (Tag tag) {
      ref.read(clockListProvider.notifier).updateClock(
            clock.copyWith(tags: [...clock.tags, tag]),
          );
    };
  }

  Function(Tag) _onPressedRemoveTag(WidgetRef ref, Clock clock) {
    return (Tag tag) {
      ref.read(clockListProvider.notifier).updateClock(
            clock.copyWith(
              tags: clock.tags.where((t) => t.name != tag.name).toList(),
            ),
          );
    };
  }
}

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
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
    return TextField(
      controller: _controller,
      onSubmitted: (value) {
        print('Submitted: $value');
      },
      decoration: const InputDecoration(
        hintText: 'Add a tag',
      ),
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
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
