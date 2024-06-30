import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../ServiceUi/FilteredServices/FilteredCustomerServicesListView.dart';

class CustomerParentWidget extends StatelessWidget {

  ParentService? service;

  CustomerParentWidget(this.service){}

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return InkWell(
      onTap:() {
        // provider.selectedCriteria = criteria ;
        // Navigator.pushNamed(context, FilteredCustomerServicesListWidget.routeName , arguments: service,);

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color:Theme.of(context).colorScheme.primary ),borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.onSecondary ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(service?.serviceName??"", style: TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.primary)),
            ],
          ),
        ),
      ),
    );
  }
}
