import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/ColorProvider.dart';

class MyAccountDetailsCard extends StatelessWidget {

  String CardName ;
  String Details;

  MyAccountDetailsCard(this.CardName , this.Details);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ColorProvider>(context);

    return   Card(
      color: provider.isDarkEnabled() ? Colors.grey : Colors.white ,
      surfaceTintColor: provider.isDarkEnabled() ? Colors.grey : Colors.white ,
      shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey, width: 1)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(CardName ,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
            Text(Details,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: '2',color: Theme.of(context).colorScheme.onPrimary)),
          ],
        ),
      ),
    );
  }
}
