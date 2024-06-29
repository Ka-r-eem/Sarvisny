import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Customer/CartUi/AddToCartScreen.dart';
import '../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'FilteredWorkers/WorkerSlotWidget.dart';

class CustomerSlotWidget extends StatelessWidget {

  Slots? slot;
  availbilityDetails? details;
  CustomerSlotWidget({this.slot, this.details}) {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AddToCartScreen.routeName , arguments: SlotAvailabilityDetails(slot: slot,details: details) );
      },
      child: Padding(
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
      ),
    );
  }
}

class SlotAvailabilityDetails{

Slots? slot;
availbilityDetails? details;

SlotAvailabilityDetails({this.slot, this.details});

}

