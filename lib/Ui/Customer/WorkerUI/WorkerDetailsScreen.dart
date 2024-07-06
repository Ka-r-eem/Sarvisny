import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Common/DropDowns/DistrictsDropDown.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/FilteredWorkers/ServiceWorkersWidget.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/FilteredWorkers/WorkerSlotWidget.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/AddProviderToFavUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';

import '../../../Provider/Provider.dart';
import '../../../di/di.dart';

class WorkerDetailsScreen extends StatefulWidget {
  static const String routeName = 'WorkerDetailsScreen';

  @override
  State<WorkerDetailsScreen> createState() => _WorkerDetailsScreenState();
}

class _WorkerDetailsScreenState extends State<WorkerDetailsScreen> {

  bool isFav = false;

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context, listen: false);

    var workerService =
        ModalRoute.of(context)?.settings.arguments as WorkerServiceDetails;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(

              onPressed: () {
                addProviderToFav(context, workerService.workerData?.id??"", provider.UserId??"");


              },

              icon: isFav ? const Icon(Icons.star, color: Colors.red , size: 26) : Icon(Icons.star_border, color: Theme.of(context).colorScheme.primary , size: 26))
        ],
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

  void addProviderToFav(context , String workerID, String customerId) async {
    AddProviderToFavUseCase addProviderToFavUseCase = getIt<AddProviderToFavUseCase>();
    var response = await addProviderToFavUseCase.invoke(workerID, customerId);
    if(response.isError == false){
      snackBar.showSnackBar(context, "Provider Added Successfully", Colors.green);
      setState(() {
        isFav = true;
      });
    }
    else{
      snackBar.showSnackBar(context, response.message.toString(), Colors.red);
    }
  }
}
