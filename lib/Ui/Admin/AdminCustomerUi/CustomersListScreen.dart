import 'package:flutter/material.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomersListResponse.dart';
import 'CustomerWidget.dart';

class CustomersListScreen extends StatelessWidget {

  List<CustomerListObject>? CustomersList ;

  CustomersListScreen({this.CustomersList}){}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8 , horizontal: 4),
            child: Text("All Customers",
                style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.primary,
                    fontFamily: "2",
                    fontWeight: FontWeight.bold)),
          ),
          Expanded(
              child: CustomersList?.length == 0 || CustomersList?.length == null ? const Center(
                child: Text("NO Customers Found"),
              ):ListView.builder(
            itemBuilder: (context, index) => CustomerWidget(CustomersList?[index]),
            itemCount: CustomersList?.length,
          ))
        ],
      ),
    );
  }
}
