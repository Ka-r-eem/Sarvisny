import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Worker/OrdersUi/AllOrders/WorkerAllOrdersListWidget.dart';
import 'package:sarvisny/Ui/Worker/OrdersUi/ApprovedOrders/WorkerApprovedOrdersListWidget.dart';
import 'package:sarvisny/Ui/Worker/OrdersUi/PendingOrders/WorkerPendingOrdersListWidget.dart';

class OrdersScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Your Orders'),
          bottom: TabBar(
            dragStartBehavior: DragStartBehavior.down,
            dividerHeight: 2,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(color: Theme.of(context).colorScheme.primary ,borderRadius: BorderRadius.only(topLeft: Radius.elliptical(10,10) ,topRight:Radius.elliptical(10,10) )),
            tabs: <Widget>[
              Tab(
                child: Text("All",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
              ),
              Tab(
                child: Text("Approved",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
              ),
              Tab(
                child: Text("Pending",style: TextStyle(color: Theme.of(context).colorScheme.onPrimary)),
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            WorkerAllOrdersListWidget(),
            WorkerApprovedOrdersListWidget(),
            WorkerPendingOrdersListWidget(),

          ],
        ),
      ),
    );
  }
}

