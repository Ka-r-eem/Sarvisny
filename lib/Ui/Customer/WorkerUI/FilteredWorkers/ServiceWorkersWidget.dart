import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/WorkerDetailsScreen.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';

class ServiceWorkerWidget extends StatelessWidget {

  WorkerData? worker;
  Children? serviceItem;

  ServiceWorkerWidget({this.worker , this.serviceItem}){}

  @override
  Widget build(BuildContext context) {


    return InkWell(
       onTap:() {
         Navigator.pushNamed(context, WorkerDetailsScreen.routeName , arguments: WorkerServiceDetails(workerData: worker , serviceItem: serviceItem));
       },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(worker?.firstName??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
class WorkerServiceDetails{

  Children? serviceItem;
  WorkerData? workerData;

  WorkerServiceDetails({this.serviceItem, this.workerData});
}

