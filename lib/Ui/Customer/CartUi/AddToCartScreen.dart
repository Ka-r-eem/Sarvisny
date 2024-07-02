import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/CustomFormField.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/AddToCartUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import '../../../Provider/Provider.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import '../../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../../Admin/AdminDistrictsUi/DistrictsDropDown.dart';
import '../WorkerUI/CustomerSlotWidget.dart';
import 'DateDropDown.dart';

class AddToCartScreen extends StatefulWidget {
  static const String routeName = 'AddToCart';

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  DistrictData? selectedDistrict;
  DateTime? selectedDate;

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
                        DistrictsDropDown(onDistrictChanged: (p0) => selectedDistrict = p0),
                        DateDropdown(
                          weekday: getWeekdayNumber(info.details?.availabilities?.dayOfWeek.toString() ?? DateTime.now().weekday.toString()),
                          onDateChanged: (DateTime date) {
                            selectedDate = date;
                          },
                        ),
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
                            [info.details?.details?.serviceItem?.childServiceID ?? ""],
                            info.slot?.timeSlotID,
                            selectedDistrict?.districtID,
                            selectedDistrict?.districtName,
                            desc.text,
                            selectedDate?.toIso8601String());
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
      List<String>? serviceIDs, String? slotID,String? districtID,String? address, String? desc, String? requestDay) async {
    try {
      print("Provider ID : $providerID");
      print("Service IDs : $serviceIDs");
      print("Slot ID : $slotID");
      print("District ID : $districtID");
      print("Address : $address");
      print(desc);
      print("Request Day : $requestDay");
      AddToCartUseCase addToCartUseCase = getIt<AddToCartUseCase>();
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      print("before assigning the response data");
      AddToCartResponse responseData = await addToCartUseCase.invoke (
          context, provider.UserId, providerID, serviceIDs, slotID,districtID,address, desc, requestDay);
      if (responseData.isError == false) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        snackBar.showSnackBar(context, "Added Successfully", Colors.green);
      } else {
        Navigator.of(context).pop();
        // print(responseData.status);
        // print(responseData.isError);
        // print(responseData.errors);
        // print(responseData.payload);
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
int getWeekdayNumber(String dayName) {
  switch (dayName.toLowerCase()) {
    case 'monday':
      return DateTime.monday;
    case 'tuesday':
      return DateTime.tuesday;
    case 'wednesday':
      return DateTime.wednesday;
    case 'thursday':
      return DateTime.thursday;
    case 'friday':
      return DateTime.friday;
    case 'saturday':
      return DateTime.saturday;
    case 'sunday':
      return DateTime.sunday;
    default:
      return DateTime.monday; // default to Monday if day name is unknown
  }
}


