import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'AllOrders/AdminAllOrdersListWidget.dart';
import 'ApprovedOrders/AdminApprovedOrdersListWidget.dart';
import 'CancelledOrders/AdminCancelledOrdersListWidget.dart';
import 'ExpiredOrders/AdminExpiredOrdersListWidget.dart';
import 'PendingOrders/AdminPendingOrdersListWidget.dart';
import 'RejectedOrders/AdminRejectedOrdersListWidget.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('All Orders'),
          bottom: TabBar(
            dragStartBehavior: DragStartBehavior.down,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.transparent,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.elliptical(10, 10),
                topRight: Radius.elliptical(10, 10),
              ),
              border: Border.all(color: Theme.of(context).colorScheme.primary),
            ),
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.list),
                text: "All",
              ),
              Tab(
                icon: Icon(Icons.check_box, color: Colors.green),
                text: "Approved",
              ),
              Tab(
                icon: Icon(Icons.pending_actions, color: Colors.orangeAccent),
                text: "Requested",
              ),
              Tab(
                icon: Icon(Icons.close_sharp, color: Colors.red),
                text: "Rejected",
              ),
              Tab(
                icon: Icon(Icons.cancel_rounded, color: Colors.red),
                text: "Cancelled",
              ),
              Tab(
                icon: Icon(Icons.delete_forever, color: Colors.red),
                text: "Expired",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            AdminAllOrdersListWidget(),
            AdminApprovedOrdersListWidget(),
            AdminPendingOrdersListWidget(),
            AdminRejectedOrdersListWidget(),
            AdminCancelledOrdersListWidget(),
            AdminExpiredOrdersListWidget(),
          ],
        ),
      ),
    );
  }
}
