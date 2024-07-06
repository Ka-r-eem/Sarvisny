import 'package:flutter/material.dart';

class eventCard extends StatelessWidget {
  final bool isPast;
  final Widget child;

  const eventCard({super.key, required this.isPast, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: isPast ? Colors.lightBlue[300] : Colors.lightBlue[100],
        borderRadius: BorderRadius.circular(25),
      ),
      child: child,
    );
  }
}
