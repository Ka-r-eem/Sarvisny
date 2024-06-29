import 'package:flutter/material.dart';

import '../../../domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';




class WorkerServiceWidget extends StatelessWidget {

  RegisteredService service;
  WorkerServiceWidget(this.service){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:() {
         // Navigator.pushNamed(context, ServiceWorkersListWidget.routeName ,  arguments: serviceItem);
       },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(service.serviceName??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

