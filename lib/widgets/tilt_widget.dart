import 'package:flutter/material.dart';

class TiltWidget extends StatelessWidget {
  final Widget child;
  final bool isLeft;

  const TiltWidget({super.key, required this.child, required this.isLeft});

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001) // Perspective depth
        // Maine yahan signs swap kar diye hain (-0.15 aur 0.15)
        // Ab Left side bahar ki taraf point karegi
        ..rotateY(isLeft ? -0.50 : 0.50),
      alignment: isLeft ? Alignment.centerRight : Alignment.centerLeft,
      child: child,
    );
  }
}
