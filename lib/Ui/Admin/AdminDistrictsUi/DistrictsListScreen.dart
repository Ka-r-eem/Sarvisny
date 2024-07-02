import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';

import '../../../Common/CustomFormField.dart';
import '../../../di/di.dart';
import '../../../domain/UseCases/AdminUseCases/AddDistrictUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/AddWorkerToDistrictUseCase.dart';
import '../../../domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';
import 'DistrictWidget.dart';
import 'DistrictsDropDown.dart';
import 'WorkersDropDown.dart';

class DistrictListScreen extends StatefulWidget {
  List<DistrictData>? DistrictsList;

  DistrictListScreen({this.DistrictsList});

  @override
  State<DistrictListScreen> createState() => _DistrictListScreenState();
}

class _DistrictListScreenState extends State<DistrictListScreen> {
  var keyform = GlobalKey<FormState>();


  DistrictData? selectedDistrict;
  WorkerListObject? selectedWorker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    DistrictWidget(widget.DistrictsList?[index]),
                itemCount: widget.DistrictsList?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
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
            label: 'Add District',
            onTap: () {
              _showAddDistrictBottomSheet(context);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.library_books_rounded),
            backgroundColor: Colors.orange,
            label: 'Add Provider to District',
            onTap: () {
              _showAddProviderToDistrictBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }
  void _showAddDistrictBottomSheet(BuildContext context) {
    TextEditingController DistrictName = TextEditingController();
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
                  Text("-Add New District-",
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: '2',
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.center),
                  CustomFormField(
                    DistrictName,
                    "District Name",
                    TextInputType.text,
                    false,
                        (text) {
                      if (text == null) {
                        return 'Please Enter District Name';
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      DistrictCreation(
                        context,
                        DistrictName.text,
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Theme.of(context).colorScheme.primary),
                    ),
                    child: const Text("Add District",
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

  void DistrictCreation(context, String? name) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      print("enter try");
      AddDistrictUseCase addDistrictUseCase = getIt<AddDistrictUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        print("enter the true");
        var responseData = await addDistrictUseCase.invoke(name);
        print("after response data");
        if (responseData.isError == false) {
          Navigator.of(context).pop();
          snackBar.showSnackBar(
              context, "District Added Successfully", Colors.green);
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(
              context, responseData.message, pos: "Ok",
              postAction: () {
                Navigator.of(context).pop();
              });
        }
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error******* $e");
    }
  }

  void _showAddProviderToDistrictBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: keyform,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("-Add Provider To District-",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: '2',
                        color: Theme.of(context).colorScheme.onPrimary),
                    textAlign: TextAlign.center),
                WorkersDropDown(onWorkerChanged: (p0) {
                  selectedWorker = p0;
                },),
                DistrictsDropDown(onDistrictChanged: (p0) {
                  selectedDistrict = p0;
                },),



                ElevatedButton(
                  onPressed: () {
                    workerAddition(selectedWorker?.id, selectedDistrict?.districtID);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text("Add Worker",
                      style: TextStyle(
                          fontSize: 22, fontFamily: '2', color: Colors.white)),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void workerAddition(String? providerID, String? districtID) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }

    try {
      AddWorkerToDistrictUseCase useCase = getIt<AddWorkerToDistrictUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");

      var responseData = await useCase.invoke(providerID, districtID);

      if (responseData.isError != true) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        snackBar.showSnackBar(context, "Worker Added Successfully", Colors.green);
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(
          context,
          responseData.message ?? "Error occurred",
          pos: "Ok",
          postAction: () {
            Navigator.of(context).pop();
          },
        );
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error: $e");
      dialoguUtilities.showmsg(
        context,
        "An error occurred. Please try again later.",
        pos: "Ok",
        postAction: () {
          Navigator.of(context).pop();
        },
      );
    }
  }


}
