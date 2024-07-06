import 'package:flutter/material.dart';
import 'package:sarvisny/Common/timeLineTile.dart';
import 'package:sarvisny/Common/eventCard.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';

class CustomerOrderDetailsScreen extends StatelessWidget {
  static const String routeName = "CustomerOrderDetailsScreen";

  @override
  Widget build(BuildContext context) {
    var order = ModalRoute.of(context)?.settings.arguments as CustomerOrdersPayload;
     int flag = 0;
    //Pending, Paid, Start, Preparing, OnTheWay, InProgress, Done, Completed
    order.orderStatus == "Pending" ? flag = 0 :
    order.orderStatus == "Paid" ? flag = 1 :
    order.orderStatus == 'Start' ? flag = 2 :
    order.orderStatus == 'Preparing' ? flag = 3 :
    order.orderStatus == 'OnTheWay' ? flag = 4 :
    order.orderStatus == 'InProgress' ? flag = 5 :
    order.orderStatus == 'Done' ? flag = 6 : flag = 7 ;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18 , vertical: 8 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Worker Name: ${order.providerFN} ${order.providerLN}" , style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Text("Start Time: ${order.startTime?.substring(0,5)}", style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Text("District: ${order.districtName}", style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Text("Request Date: ${order.orderDate?.substring(0, 10)}", style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Text("Request Day: ${order.dayOfWeek}", style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Text("Order Price: ${order.price} EGP", style: TextStyle(fontFamily: "2" ,color: Theme.of(context).colorScheme.primary ,fontSize: 20),),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0 , horizontal: 8),
                child: ListView(
                  children: [
                    myTimeLineTile(
                      isFirst: true,
                      isLast: false,
                      isPast: flag == 0 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 0 ? false : true,
                        child: const Text(
                          "Pending",
                          style: TextStyle(color: Colors.white , fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 1 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 1 ? false : true,
                        child: const Text(
                          "Paid",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 2 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 2 ? false : true,
                        child: const Text(
                          "Started",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 3 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 3 ? false : true,
                        child: const Text(
                          "Preparing",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 4 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 4 ? false : true,
                        child: const Text(
                          "On The Way",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 5 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 5 ? false : true,
                        child: const Text(
                          "In Progress",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: false,
                      isPast: flag == 6 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 6 ? false : true,
                        child: const Text(
                          "Done",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    myTimeLineTile(
                      isFirst: false,
                      isLast: true,
                      isPast: flag == 7 ? false : true,
                      eventCard: eventCard(
                        isPast: flag == 7 ? false : true,
                        child: const Text(
                          "Completed",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
