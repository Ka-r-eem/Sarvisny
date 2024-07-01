import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/CustomFormField.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/AddToCartUseCase.dart';
import '../../../Provider/Provider.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import '../../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../WorkerUI/CustomerSlotWidget.dart';

class AddToCartScreen extends StatefulWidget {
  static const String routeName = 'AddToCart';


  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController desc = TextEditingController();
    var info = ModalRoute.of(context)?.settings.arguments as SlotAvailabilityDetails;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("-Request Details-", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Card(
                  color: Theme.of(context).colorScheme.onSecondary,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "Worker Name: ${info.details?.details?.workerData?.firstName} ${info.details?.details?.workerData?.lastName}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                                fontFamily: '2')),
                        Text(
                            "ID: ${info.details?.details?.serviceItem?.childServiceID} ${info.details?.details?.workerData?.lastName}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                                fontFamily: '2')),
                        // Text(
                        //     "Description: ${info.details?.details?.serviceItem?.des}",
                        //     style: TextStyle(
                        //         color: Theme.of(context).colorScheme.onPrimary,
                        //         fontSize: 22,
                        //         fontFamily: '2')),
                        Text(
                            "Request Day: ${info.details?.availabilities?.dayOfWeek}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                                fontFamily: '2')),
                        Text(
                            "Request Time: ${info.slot?.startTime?.substring(0, 5)} ${info.slot?.endTime?.substring(0, 5)}",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 22,
                                fontFamily: '2')),
                        // Text(
                        //     "Price: ${info.details?.details?.serviceItem?.price}",
                        //     style: TextStyle(
                        //         color: Theme.of(context).colorScheme.onPrimary,
                        //         fontSize: 22,
                        //         fontFamily: '2')),
                      ],
                    ),
                  ),
                ),
              ),
              Text("Tell us Your Problem if you Like :)",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 22,
                      fontFamily: '2')),
              CustomFormField(
                desc,
                "Your Problem",
                TextInputType.multiline,
                false,
                (p0) {},
                fieldHeight: 150,
              ),
              Container(
                  height: 60,
                  child: MaterialButton(
                      onPressed: () {
                        AddToCartBtnFunction(
                            context,
                            info.details?.details?.workerData?.id,
                            info.details?.details?.serviceItem?.childServiceID,
                            info.slot?.timeSlotID,
                            desc.text);
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Theme.of(context).colorScheme.primary,
                      child: const Text("Add to Cart",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: '2',
                              fontSize: 22))))
            ]),
      ),
    );
  }

  Future<void> AddToCartBtnFunction(context, String? providerID,
      String? serviceId, String? slotID, String? desc) async {
    try {
      print(providerID);
      print(serviceId);
      print(slotID);
      print(desc);
      AddToCartUseCase addToCartUseCase = getIt<AddToCartUseCase>();
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      print("before assigning the response data");
      AddToCartResponse responseData = await addToCartUseCase.invoke (
      context, provider.UserId, providerID, serviceId, slotID, desc);
      if (responseData.isError == false) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        provider.IncreaseCart();
        snackBar.showSnackBar(context, "Added Successfully", Colors.green);
      } else {
        Navigator.of(context).pop();
        print(responseData.status);
        print(responseData.isError);
        print(responseData.errors);
        print(responseData.payload);
        dialoguUtilities.showmsg(context, responseData.message.toString(),
            pos: "Ok", postAction: () {
              Navigator.of(context).pop();
              print(responseData.payload);
            });
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******$e");
    }
  }
}


