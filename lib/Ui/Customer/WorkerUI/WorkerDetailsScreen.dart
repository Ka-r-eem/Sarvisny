import 'package:flutter/material.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Ui/Admin/AdminDistrictsUi/DistrictsDropDown.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/FilteredWorkers/ServiceWorkersWidget.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/FilteredWorkers/WorkerSlotWidget.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';

class WorkerDetailsScreen extends StatelessWidget {
  static const String routeName = 'WorkerDetailsScreen';

  @override
  Widget build(BuildContext context) {

    DistrictData? selectedDistrict;

    var workerService =
        ModalRoute.of(context)?.settings.arguments as WorkerServiceDetails;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(workerService.workerData?.firstName ?? ""),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Name: ${workerService.workerData?.firstName} ${workerService.workerData?.lastName}",
                style: TextStyle(
                    fontSize: 22,
                    color: Theme.of(context).colorScheme.primary)),
            Text("Email: ${workerService.workerData?.email}",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary)),
            Text("ID: ${workerService.serviceItem?.childServiceID}",
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.primary)),
            Seperator(),
            Center(
              child: Text(
                "Available Slots",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary, fontSize: 25),
              ),
            ),
            Seperator(),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) {
                    return WorkerSlotWidget(
                      availabilities:
                          workerService.workerData?.availabilities?[index],
                      details: workerService,
                    );
                  },
                  itemCount: workerService.workerData?.availabilities?.length),
            ),
          ],
        ),
      ),
    );
  }
}
