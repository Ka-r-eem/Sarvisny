import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Seperator extends StatelessWidget {
  const Seperator({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.blue,
      period: Duration(seconds: 5),
      child: Divider(
          height: 20 ,thickness: 4 ,indent: 20 ,endIndent: 20 ,color: Theme.of(context).colorScheme.primary),
    );
  }
}
