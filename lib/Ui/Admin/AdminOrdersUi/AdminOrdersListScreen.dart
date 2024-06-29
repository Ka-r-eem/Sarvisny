import 'package:flutter/material.dart';
import '../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';
import 'OrderWidgets/AdminOrderWidget.dart';

class AdminOrdersListScreen extends StatefulWidget {
  List<OrderResponse>? ordersList;

  AdminOrdersListScreen({Key? key, this.ordersList}) : super(key: key);

  @override
  State<AdminOrdersListScreen> createState() => _AdminOrdersListScreenState();
}

class _AdminOrdersListScreenState extends State<AdminOrdersListScreen> {
  var keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: widget.ordersList?.length == 0 || widget.ordersList == null
                ? Center(
                    child: Text(
                    "No Orders Found",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ))
                : ListView.builder(
                    itemBuilder: (context, index) =>
                        AdminOrderWidget(widget.ordersList?[index].payload),
                    itemCount: widget.ordersList?.length,
                  ),
          ),
        ],
      ),
    );
  }
}
