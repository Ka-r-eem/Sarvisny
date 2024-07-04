import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/Provider.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import 'OrderWidget.dart';

class CustomerOrderListScreen extends StatelessWidget {
  static const String routeName = "ordersList";

  List<CustomerOrdersPayload?> orderList;

  CustomerOrderListScreen(this.orderList);

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: provider.token == null || provider.token == "" ?const Center(
              child: Text(
                "Please Login to See Your Orders :(",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ) : orderList != null && orderList!.isNotEmpty
                ? ListView.builder(
              itemBuilder: (context, index) =>
                  CustomerOrderWidget(orderList[index]),
              itemCount: orderList!.length,
            )
                : const Center(
              child: Text(
                "No Orders Available",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
