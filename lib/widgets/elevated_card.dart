
import 'package:flutter/material.dart';

class ElevatedCard extends StatelessWidget {
  final Widget child;
  const ElevatedCard({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 10,
        child: child);
  }
}