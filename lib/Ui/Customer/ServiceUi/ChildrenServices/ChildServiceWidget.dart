import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

import '../../WorkerUI/FilteredWorkers/ServiceWorkersListView.dart';


class ChildServiceWidget extends StatelessWidget {

  Children? child;

  ChildServiceWidget(this.child){}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() {
        Navigator.pushNamed(context, ServiceWorkersListView.routeName ,  arguments: child);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const SizedBox(height: 4,),
              Text(child?.childServiceName??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

