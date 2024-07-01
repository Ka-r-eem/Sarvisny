import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Customer/ServiceUi/ChildrenServices/ChildrenServicesListView.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../WorkerUI/FilteredWorkers/ServiceWorkersListView.dart';

class CustomerServiceWidget extends StatelessWidget {

  CustomerServiceItem? serviceItem;

  CustomerServiceWidget(this.serviceItem){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:() {
         print(serviceItem?.serviceID);
         Navigator.pushNamed(context, ChildrenServicesListWidget.routeName , arguments: serviceItem);
       },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(serviceItem?.serviceName??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

