import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import 'ServiceWorkersWidget.dart';

class ServiceWorkersListScreen extends StatefulWidget {


  List<WorkerData>? workersList;
  Children? serviceItem;

  ServiceWorkersListScreen({Key? key, this.workersList , required this.serviceItem}) : super(key: key);

  @override
  State<ServiceWorkersListScreen> createState() => _ServiceWorkersListScreenState();
}

class _ServiceWorkersListScreenState extends State<ServiceWorkersListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text("Our Workers",style: TextStyle(color: Theme.of(context).colorScheme.primary ,fontSize: 25,fontFamily: '2'),),

      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    ServiceWorkerWidget(worker: widget.workersList?[index], serviceItem: widget.serviceItem),
                itemCount: widget.workersList?.length,
                
              ),
            ),
          ],
        ),
      ),

    );
  }

}
