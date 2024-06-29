import 'package:flutter/material.dart';
import '../../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../CustomerSlotWidget.dart';
import 'ServiceWorkersWidget.dart';

class WorkerSlotWidget extends StatelessWidget {

  Availabilities? availabilities;
  WorkerServiceDetails? details;

  WorkerSlotWidget({this.availabilities, this.details});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).colorScheme.primary)),
      child: Container(
        height: 300,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text("Day: ${availabilities?.dayOfWeek}",style: TextStyle(color: Theme.of(context).colorScheme.primary ,fontSize: 20)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return CustomerSlotWidget(slot:availabilities?.slots?[index] , details: availbilityDetails(details: details ,availabilities: availabilities));
                },
                itemCount: availabilities?.slots?.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class availbilityDetails {
  Availabilities? availabilities;
  WorkerServiceDetails? details;

  availbilityDetails({this.availabilities, this.details});



}
