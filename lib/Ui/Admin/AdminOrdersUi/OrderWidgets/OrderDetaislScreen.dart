import 'package:flutter/material.dart';
import '../../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'OrderSingleServiceWidget.dart';

class OrderDetailsScreen extends StatefulWidget {
  orderDetails? details;

  OrderDetailsScreen(this.details);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("-Order Details-", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.onSecondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Customer Name: ${widget.details?.customerFN}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Text("Address: ${widget.details?.orderStatus}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Text("Date: ${widget.details?.orderDate?.substring(0, 10)}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: widget.details?.orderService?.length == 0
                                ? Text("No Services")
                                : Column(
                                    children: [
                                      Text("Requested Services",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontFamily: '2',
                                              fontSize: 22)),
                                      Expanded(
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return OrderSingleServiceWidget(
                                                widget.details
                                                    ?.orderService?[index]);
                                          },
                                          itemCount: widget
                                              .details?.orderService?.length,
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                    ),
                    Text("Total Price: ${widget.details?.orderPrice} EGP",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: widget.details?.orderStatus == 'Approved'
                        ? Colors.green
                        : widget.details?.orderStatus == "Pending"
                            ? Colors.blue
                            : widget.details?.orderStatus == "Rejected"
                                ? Colors.red
                                : widget.details?.orderStatus == "Canceled"
                                    ? Colors.red
                                    : Colors.green,
                  ),
                  height: 50,
                  child: Center(
                      child: Text(widget.details?.orderStatus ?? "",
                          style: TextStyle(fontSize: 25, color: Colors.white))),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
