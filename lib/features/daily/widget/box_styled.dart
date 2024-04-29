import 'package:flutter/material.dart';

class BoxStyled extends StatelessWidget {
  const BoxStyled({
    super.key,
    required this.child,
    this.hPadding = 50.0,
    this.vPadding = 20.0,
  });

  final Widget child;
  final double hPadding;
  final double vPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: EdgeInsets.symmetric(
        vertical: vPadding,
        horizontal: hPadding,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
