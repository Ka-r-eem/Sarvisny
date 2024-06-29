import 'package:flutter/material.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../CustomerServiceWidget.dart';

class CustomerServicesListScreen extends StatefulWidget {


  List<CustomerServiceItem>? ServicesList;

  CustomerServicesListScreen({Key? key, this.ServicesList}) : super(key: key);

  @override
  State<CustomerServicesListScreen> createState() => _CustomerServicesListScreenState();
}

class _CustomerServicesListScreenState extends State<CustomerServicesListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    CustomerServiceWidget(widget.ServicesList?[index]),
                itemCount: widget.ServicesList?.length,
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
