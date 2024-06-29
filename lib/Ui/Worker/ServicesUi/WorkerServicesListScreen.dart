import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Worker/ServicesUi/ServiceDropDown.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/RegisterNewServiceUseCase.dart';
import '../../../Common/CustomFormField.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';
import 'WorkerServiceWidget.dart';

class WorkerServicesListScreen extends StatefulWidget {


  List<RegisteredService>? ServicesList;

  WorkerServicesListScreen({Key? key, this.ServicesList}) : super(key: key);

  @override
  State<WorkerServicesListScreen> createState() => _WorkerServicesListScreenState();
}

class _WorkerServicesListScreenState extends State<WorkerServicesListScreen> {

  var keyform = GlobalKey<FormState>();
  ServiceObject? selectedService;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text("Registered Services",style: TextStyle(color: Theme.of(context).colorScheme.primary ,fontSize: 25 ,fontFamily: '2'),)),
            Expanded(
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    WorkerServiceWidget(widget.ServicesList![index]),
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
            label: 'Register New Service',
            onTap: () {
              _showRegisterServiceBottomSheet(context);
            },
          ),
        ],
      ),
    );
  }

  void _showRegisterServiceBottomSheet(BuildContext context) {
    TextEditingController price = TextEditingController();
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
                Text("-Register New Service-",
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: '2',
                        color: Theme.of(context).colorScheme.onPrimary),
                    textAlign: TextAlign.center),
                // ServiceDropDown(onServiceChanged: (p0) => selectedService = p0),
                CustomFormField(
                  price,
                  "Price",
                  const TextInputType.numberWithOptions(decimal: true),
                  false,
                      (text) {
                    if (text == null) {
                      return 'Please Enter Price';
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                  ServiceRegistration(context,selectedService?.serviceID , double.parse(price.text))  ;
                  print(selectedService?.serviceID);
                  print(price.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text("Register Service",
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

  void ServiceRegistration(context,
       String? serviceId , double? price) async {
    if (keyform.currentState?.validate() == false) {
      return;
    }
    print(keyform.currentState?.validate());
    try {
      RegisterNewServiceUseCase registerNewServiceUseCase = getIt<RegisterNewServiceUseCase>();
      var provider = Provider.of<AppProvider>(context ,  listen: false);

      dialoguUtilities.loadingDialog(context, "Please Wait...");
      if (keyform.currentState?.validate() == true) {
        var responseData = await registerNewServiceUseCase.invoke(provider.UserId, serviceId, price);
        print(responseData.message);
        if (responseData.isError == false) {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          snackBar.showSnackBar(
              context, "Registered Successfully", Colors.green);
        } else {
          Navigator.of(context).pop();
          print(responseData.isError);
          print(responseData.status);
          print(responseData.errors);
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
