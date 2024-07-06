import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Common/DropDowns/ParentsDropDown.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/AdminUseCases/GetParentsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';

import '../../../Common/CustomFormField.dart';
import '../../../data/Responses/AdminRelatedDto/CriteriaData.dart';
import '../../../di/di.dart';
import '../../../domain/UseCases/AdminUseCases/AddCriteriaUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/AddServiceToCriteriaUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/AddServiceUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart';
import '../../../domain/model/AdminRelatedResponses/AddServiceData.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriaData.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../../Common/DropDowns/CriteriaDropDown.dart';
import 'ServiceWidget.dart';

class ServicesListScreen extends StatefulWidget {
  List<ServiceObject>? ServicesList;
  AddCriteriaUseCase addCriteriaUseCase ;
  AddServiceUseCase addServiceUseCase ;
  AddServiceToCriteriaUseCase addServiceToCriteriaUseCase ;

  ServicesListScreen({this.ServicesList , required this.addServiceUseCase , required this.addCriteriaUseCase , required this.addServiceToCriteriaUseCase});

  @override
  State<ServicesListScreen> createState() => _ServicesListScreenState();
}

class _ServicesListScreenState extends State<ServicesListScreen> {
  var keyform = GlobalKey<FormState>();


  CriteriaObject? selectedCriteria;
  ParentService? selectedParent;
  String? subService;
  bool visible = false ;

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
                    ServiceWidget(widget.ServicesList?[index]),
                itemCount: widget.ServicesList?.length,
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
            label: 'Add Service',
            onTap: () {
              _showAddServiceBottomSheet(context);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.library_books_rounded),
            backgroundColor: Colors.orange,
            label: 'Add Criteria',
            onTap: () {
              _showAddCriteriaBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAddCriteriaBottomSheet(BuildContext context) {
    TextEditingController criteriaName = TextEditingController();
    TextEditingController criteriaDescription = TextEditingController();
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
                Text("-Criteria-",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: '2',
                        color: Theme.of(context).colorScheme.onPrimary),
                    textAlign: TextAlign.center),
                CustomFormField(
                  criteriaName,
                  "Criteria Name",
                  TextInputType.text,
                  false,
                  (text) {
                    if (text == null) {
                      return 'Please Enter Criteria Name';
                    }
                  },
                ),
                CustomFormField(
                  fieldHeight: 200,
                  criteriaDescription,
                  "Criteria Description",
                  TextInputType.multiline,
                  false,
                  (text) {
                    if (text == null) {
                      return 'Please Enter Criteria Description';
                    }
                  },
                ),

                ElevatedButton(
                  onPressed: () {
                    criteriaCreation(criteriaName, criteriaDescription);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text("Add Criteria",
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

  void criteriaCreation(
      TextEditingController name, TextEditingController des) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    print("entering the try ");
    try {
      print("inside the try");
      AddCriteriaUseCase useCase = getIt<AddCriteriaUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      print("after the loading");
      if (keyform.currentState?.validate() == true) {
        print("inside the first ");
        var responseData = await useCase.invoke(CriteriaData(criteriaName: name.text, description: des.text));
        if (responseData['criteriaID'] != null) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          snackBar.showSnackBar(
              context, "Criteria Added Successfully", Colors.green);
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(
              context, responseData["errors"]["\$values"].toString(), pos: "Ok",
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

  void _showAddServiceBottomSheet(BuildContext context) async {
    TextEditingController ServiceName = TextEditingController();
    TextEditingController ServiceDescription = TextEditingController();
    ShowAllCriteriasUseCase showAllCriteriasUseCase = getIt<ShowAllCriteriasUseCase>();
    var list = await showAllCriteriasUseCase.invoke();
    GetParentsUseCase getParentsUseCase = getIt<GetParentsUseCase>();
    var parents = await getParentsUseCase.invoke();
    showModalBottomSheet(
      context: context,
      builder: (context) {
        bool visible = false;
        String? subService;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SingleChildScrollView(
              child: Form(
                key: keyform,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text("-Add New Service-",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: '2',
                              color: Theme.of(context).colorScheme.onPrimary),
                          textAlign: TextAlign.center),
                      CriteriasDropDown(
                        onCriteriaChanged: (p0) {
                          selectedCriteria = p0;
                        },
                      ),
                      CustomFormField(
                        ServiceName,
                        "Service Name",
                        TextInputType.text,
                        false,
                            (text) {
                          if (text == null) {
                            return 'Please Enter Service Name';
                          }
                        },
                      ),
                      CustomFormField(
                        fieldHeight: 200,
                        ServiceDescription,
                        "Service Description",
                        TextInputType.multiline,
                        false,
                            (text) {
                          if (text == null) {
                            return 'Please Enter Service Description';
                          }
                        },
                      ),
                      Column(
                        children: [
                          Text("Is This a SubService ?"),
                          Row(
                            children: [
                              Radio<String>(
                                value: 'Yes',
                                groupValue: subService,
                                onChanged: (value) {
                                  setModalState(() {
                                    visible = true;
                                    subService = value;
                                  });
                                },
                              ),
                              const Text('Yes'),
                              Radio<String>(
                                value: 'No',
                                groupValue: subService,
                                onChanged: (value) {
                                  setModalState(() {
                                    visible = false;
                                    subService = value;
                                  });
                                },
                              ),
                              const Text('No'),
                            ],
                          ),
                        ],
                      ),
                      Visibility(
                        visible: visible,
                        child: ParentsDropDown(
                          onParentChanged:  (p0) {
                            selectedParent = p0;
                          },
                        )
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ServiceCreation(
                              context,
                              ServiceName.text,
                              ServiceDescription.text,
                              selectedCriteria?.criteriaID);
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                        ),
                        child: const Text("Add Service",
                            style: TextStyle(
                                fontSize: 22,
                                fontFamily: '2',
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  void ServiceCreation(context, String? name, String? des, String? CriteriaId) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      print("enter try");
      AddServiceUseCase addServicesUseCase = getIt<AddServiceUseCase>();
      AddServiceToCriteriaUseCase addServiceToCriteriaUseCase = getIt<AddServiceToCriteriaUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        print("enter the true");
        var responseData = await addServicesUseCase.invoke(AddServiceData(
            payload: ServiceToBeAdded.add(
              serviceName: name,
              description: des,
            )));
        print("after response data");
        if (responseData['isError'] == false) {
          var AddtoCriteria = await addServiceToCriteriaUseCase.invoke(
              CriteriaId, responseData["payload"]["serviceID"]);
          if (AddtoCriteria["isError"] == false) {
            Navigator.of(context).pop();
            snackBar.showSnackBar(
                context, "Service Added Successfully", Colors.green);
          }
        } else {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          dialoguUtilities.showmsg(
              context, responseData["errors"]["\$values"].toString(), pos: "Ok",
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
}
