import 'package:flutter/material.dart';
import '../../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';



class SlotsWidget extends StatelessWidget {

  Slots? slot;

  SlotsWidget(this.slot) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Card(
        elevation: 30,
        shadowColor: Theme.of(context).colorScheme.primary,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.white),
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(slot?.startTime?.substring(0,5) ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "2",
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary)),
              Text(slot?.endTime?.substring(0,5) ?? "",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "2",
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary)),

            ],
          ),
        ),
      ),
    );
  }
}
