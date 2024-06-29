import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../ServiceUi/FilteredServices/FilteredCustomerServicesListView.dart';

class CustomerCriteriaWidget extends StatelessWidget {

  CriteriaObject? criteria;

  CustomerCriteriaWidget(this.criteria){}

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return InkWell(
       onTap:() {
         // provider.selectedCriteria = criteria ;
         Navigator.pushNamed(context, FilteredCustomerServicesListWidget.routeName , arguments: criteria,);

       },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(border: Border.all(color:Theme.of(context).colorScheme.primary ),borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.onSecondary ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(criteria?.criteriaName??"", style: TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.primary)),
              Text(criteria?.description??"", style: TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Theme.of(context).colorScheme.primary)),
              ],
          ),
        ),
      ),
    );
  }
}
