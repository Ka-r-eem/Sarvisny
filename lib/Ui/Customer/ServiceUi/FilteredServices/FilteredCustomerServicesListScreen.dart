import 'package:flutter/material.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../CustomerServiceWidget.dart';

class FilteredCustomerServicesListScreen extends StatefulWidget {


  List<CustomerServiceItem>? FilteredServicesList;
  String? criteriaName ;

  FilteredCustomerServicesListScreen({Key? key, this.FilteredServicesList , this.criteriaName}) : super(key: key);

  @override
  State<FilteredCustomerServicesListScreen> createState() => _FilteredCustomerServicesListScreenState();
}

class _FilteredCustomerServicesListScreenState extends State<FilteredCustomerServicesListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.criteriaName??"",style: TextStyle(color: Theme.of(context).colorScheme.primary ,fontSize: 22,fontFamily: '2'),)),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Filtered Services",style: TextStyle(fontFamily: '2',fontSize: 25,color: Theme.of(context).colorScheme.primary),),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    CustomerServiceWidget(widget.FilteredServicesList?[index]),
                itemCount: widget.FilteredServicesList?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
              ),
            ),
          ],
        ),
      ),

    );
  }

}
