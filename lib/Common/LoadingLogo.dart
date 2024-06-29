import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LogoLoader extends StatelessWidget {
  const LogoLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.blue,
        highlightColor: Colors.black,
        child: const Padding(
          padding: EdgeInsets.all(22),
          child: Image(
            width: 300,
              height: 200,
              image: AssetImage("assets/images/LogoLight.png")),
        ));
  }
}
