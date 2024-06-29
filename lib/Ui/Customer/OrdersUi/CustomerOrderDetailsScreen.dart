import 'package:flutter/material.dart';

import '../../../data/Responses/CustomerRelatedDto/CustomerOrdersLogResponse.dart';
import 'CustomerOrderSingleServiceWidget.dart';

class CustomerOrderDetailsScreen extends StatelessWidget {
  static const String routeName = "CustomerOrderDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var order = ModalRoute.of(context)?.settings.arguments as CustomerOrderDetailsDto;

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        color: Theme.of(context).colorScheme.onSecondary,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Status: ${order.payload?.orderStatus}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 22,
                  fontFamily: '2',
                ),
              ),
              Text(
                "Order Date: ${order.payload?.orderDate?.substring(0, 10)}",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 22,
                  fontFamily: '2',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: order.payload?.orderService?.isEmpty ?? true
                      ? Text("No Services")
                      : Column(
                    children: [
                      Text(
                        "Requested Services",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontFamily: '2',
                          fontSize: 22,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return CustomerOrderSingleServiceWidget(
                              order.payload?.orderService?[index],
                            );
                          },
                          itemCount: order.payload?.orderService?.length ?? 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Total Price: ${order.payload?.orderPrice} EGP",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 22,
                  fontFamily: '2',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
