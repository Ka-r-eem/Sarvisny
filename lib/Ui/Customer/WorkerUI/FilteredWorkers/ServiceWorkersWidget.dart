import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/WorkerDetailsScreen.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';

class ServiceWorkerWidget extends StatelessWidget {
  WorkerData? worker;
  Children? serviceItem;

  ServiceWorkerWidget({this.worker, this.serviceItem}) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: Theme.of(context).colorScheme.primary, width: 2),
            color: Colors.white),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${worker?.firstName} ${worker?.lastName}",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "2",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary)),
                IconButton(
                  icon: Icon(Icons.navigate_next_rounded , size: 40, color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                  {
                    Navigator.pushNamed(context, WorkerDetailsScreen.routeName,
                        arguments: WorkerServiceDetails(
                            workerData: worker, serviceItem: serviceItem));
                  }
                },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WorkerServiceDetails {
  Children? serviceItem;
  WorkerData? workerData;

  WorkerServiceDetails({this.serviceItem, this.workerData});
}
