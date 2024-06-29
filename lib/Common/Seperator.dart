import 'package:flutter/material.dart';

class Seperator extends StatelessWidget {
  const Seperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
        height: 20 ,thickness: 4 ,indent: 20 ,endIndent: 20 ,color: Theme.of(context).colorScheme.primary);
  }
}
