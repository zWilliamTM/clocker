import 'package:clocker/features/clocks/widget/box_styled.dart';
import 'package:flutter/material.dart';

class SectionView extends StatelessWidget {
  const SectionView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BoxStyled(
      vPadding: 0,
      hPadding: 0,
      child: SizedBox(
        height: 25,
        child: Center(child: child),
      ),
    );
  }
}
