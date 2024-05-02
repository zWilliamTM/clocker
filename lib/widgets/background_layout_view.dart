import 'package:flutter/material.dart';

class BackgroundLayoutView extends StatelessWidget {
  const BackgroundLayoutView({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.cyan,
      ),
      child: child,
    );
  }
}
