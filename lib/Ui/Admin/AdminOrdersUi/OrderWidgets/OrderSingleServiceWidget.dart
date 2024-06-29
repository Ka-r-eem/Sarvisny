import 'package:flutter/material.dart';

import '../../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';

class OrderSingleServiceWidget extends StatelessWidget {

  OrderService? service;
  OrderSingleServiceWidget(this.service);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(border: Border.all(color: Theme.of(context).colorScheme.primary ),borderRadius: BorderRadius.circular(18)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Service: ${service?.serviceName} "??"",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary , fontSize: 18)),
            Text("Time: ${service?.startTime?.substring(0,5)} "??"",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary , fontSize: 18)),
            Text("Price: ${service?.price} EGP"??"",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary , fontSize: 18)),
             ],
        ),
      ),
    );
  }
}
