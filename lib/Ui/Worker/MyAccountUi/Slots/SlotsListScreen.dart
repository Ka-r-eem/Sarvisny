import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sarvisny/Ui/Worker/MyAccountUi/Slots/SlotsListWidget.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/RemoveAvailabilityUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/SetAvailabilityUseCase.dart';
import '../../../../data/API/apiManager.dart';

import '../../../../data/Responses/CustomerRelatedDto/GetServiceWorkersResponse.dart';
import '../../../../data/Responses/WorkerRelatedDto/SetAvailabilityResponse.dart';
import '../../../../di/di.dart';
import '../../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import 'DayOfWeekSlotWidget.dart';

class SlotsListScreen extends StatefulWidget {

  static const String routeName = "SlotsScreen";

  List<WorkerSlots>? SlotsList;

  SlotsListScreen({Key? key, this.SlotsList}) : super(key: key);

  @override
  State<SlotsListScreen> createState() => _SlotsListScreenState();
}

class _SlotsListScreenState extends State<SlotsListScreen> {
  var keyform = GlobalKey<FormState>();
  CriteriaObject? selectedCriteria;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Slots",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: '2',
                fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    DayOfWeekSlotWidget(daySlot:widget.SlotsList?[index]),
                itemCount: widget.SlotsList?.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(size: 22.0),
        closeManually: false,
        elevation: 20,
        curve: Curves.easeIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        children: [
          SpeedDialChild(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            label: 'Add Slot',
            onTap: () {
              _showAddSlotBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAddSlotBottomSheet(BuildContext context) {

    TextEditingController dayController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    String? startTime;
    String? endTime;

    Future<void> _selectDate(
        BuildContext context, TextEditingController controller) async {
      DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );

      if (picked != null) {
        dateController.text = picked.toLocal().toString().substring(0, 10);
        // Extract the day from the picked date and update the dayController
        dayController.text = picked.weekday == 1
            ? "Monday"
            : picked.weekday == 2
                ? "Tuesday"
                : picked.weekday == 3
                    ? "Wednesday"
                    : picked.weekday == 4
                        ? "Thursday"
                        : picked.weekday == 5
                            ? "Friday"
                            : picked.weekday == 6
                                ? "Saturday"
                                : picked.weekday == 7
                                    ? "Sunday"
                                    : "";
      }
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Form(
            key: keyform,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text("-Add Slot-",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: '2',
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.center),

                  // Day TextFormfield
                  TextFormField(
                    controller: dayController,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                    decoration: InputDecoration(
                      labelText: 'Day',
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a day';
                      }
                      return null;
                    },
                  ),

                  // Date TextFormfield with GestureDetector for Date Picker
                  TextFormField(
                    controller: dateController,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.date_range_rounded,
                          color: Theme.of(context).colorScheme.onPrimary),
                      labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                    onTap: () {
                      _selectDate(context, dateController);
                    },
                  ),

                  // StartTime DropdownButtonFormField
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          dropdownColor:
                              Theme.of(context).colorScheme.onSecondary,
                          menuMaxHeight: 200,
                          value: startTime,
                          decoration: InputDecoration(
                              labelText: 'Start Time',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                          items: List.generate(
                            24,
                            (index) => DropdownMenuItem<String>(
                              value: '${index.toString().padLeft(2, '0')}:00',
                              child: Text(
                                  '${index.toString().padLeft(2, '0')}:00'),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              startTime = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select start time';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      // EndTime DropdownButtonFormField
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          menuMaxHeight: 200,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                          value: endTime,
                          dropdownColor:
                              Theme.of(context).colorScheme.onSecondary,
                          decoration: InputDecoration(
                              labelText: 'End Time',
                              labelStyle: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary)),
                          items: List.generate(
                            24,
                            (index) => DropdownMenuItem<String>(
                              value: '${index.toString().padLeft(2, '0')}:00',
                              child: Text(
                                  '${index.toString().padLeft(2, '0')}:00'),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              endTime = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select end time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    onPressed: () {
                      print("day : ${dayController.text}");
                      print(dateController.text);
                      _addSlot(context, dayController.text, dateController.text, startTime, endTime);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                    ),
                    child: const Text("Add Slot",
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: '2',
                            color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
  Future<void> _addSlot ( context, String? day, String? date, String? startTime, String? endTime) async {
    // Create Slots object
    SlotsDto slot = SlotsDto(startTime: startTime, endTime: endTime);

    // Make API call
    await SlotCreation (context, day, date, slot);
  }

  Future<void> SlotCreation (context, String? day, String? date, SlotsDto slot) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      SetAvailabilityUseCase setAvailabilityUseCase = getIt<SetAvailabilityUseCase>();
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        print("before assigning the response data");
        var responseData = await setAvailabilityUseCase.invoke(provider.UserId, SetAvailabilityResponseDto(
          payload: AvailabilityDetailsDto(
            dayOfWeek: day,
            availabilityDate: date,
            serviceProviderID: provider.UserId,
            slots: [slot],
          ),
        ));
        if (responseData.isError == false) {
          print("Entering isError");
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          snackBar.showSnackBar(
              context, "Slot Added Successfully", Colors.green);
        } else {
          print("Entering Else");
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(
              context, responseData.message.toString(), pos: "Ok",
              postAction: () {
                Navigator.of(context).pop();
              });
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******");
    }
  }


}
enum Day { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }
