import 'package:flutter/material.dart';
import 'package:sarvisny/dialoguUtilites.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("Press"),
        onPressed:() {
          dialoguUtilities.showmsg(context, "Are You Sure"  ,pos: "Yes",postAction: () {

          },txt: "No");
        },
      ),
    );
  }
}
