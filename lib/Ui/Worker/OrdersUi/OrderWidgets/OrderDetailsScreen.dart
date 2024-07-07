import 'package:flutter/material.dart';
import 'package:sarvisny/Common/DropDowns/OrderStatusDropDown.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/CancelOrderUseCase.dart';
import '../../../../di/di.dart';
import '../../../../domain/UseCases/WorkerUseCases/SetOrderStatusUseCase.dart';
import '../../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'OrderSingleServiceWidget.dart';

class OrderDetailsScreen extends StatefulWidget {
  orderDetails? details;

  OrderDetailsScreen({this.details});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool setStatusIdentifier = false;



  String? selectedStatus;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("-Order Details-", style: TextStyle(fontSize: 30)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
        child: Column(children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.primary, width: 2),
                  borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.onSecondary,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        "Customer Name: ${widget.details?.customerFN}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Text("Address: ${widget.details?.address}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Text("Date: ${widget.details?.orderDate?.substring(0, 10)}",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            padding: EdgeInsets.all(8),
                            height: 300,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color:
                                        Theme.of(context).colorScheme.primary)),
                            child: widget.details?.orderService?.length == 0
                                ? Text("No Services")
                                : Column(
                                    children: [
                                      Text("Requested Services",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              fontFamily: '2',
                                              fontSize: 22)),
                                      Expanded(
                                        child: ListView.builder(
                                          itemBuilder: (context, index) {
                                            return OrderSingleServiceWidget(
                                                widget.details
                                                    ?.orderService?[index]);
                                          },
                                          itemCount: widget
                                              .details?.orderService?.length,
                                        ),
                                      ),
                                    ],
                                  )),
                      ),

                    Text("Total Price: ${widget.details?.orderPrice} EGP",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                    OrderStatusDropDown(onStatusChanged: (p0) {
                      selectedStatus = p0;
                      setState(() {
                        setStatusIdentifier = true;
                      });
                    },
                    currentStatus: widget.details?.orderStatus??"Select Order Status",),
                    Visibility(
                      visible: setStatusIdentifier ,
                      child: FloatingActionButton.extended(

                        onPressed: () {
                          setStatus(context, widget.details?.orderId, selectedStatus);
                          setState(() {
                            setStatusIdentifier = false;
                          });
                        },
                        heroTag: 'Set Status',
                        elevation: 0,
                        backgroundColor: Colors.lightBlue[200],
                        label: const Text("Set Order Status"),
                        icon: const Icon(Icons.check_circle_outline),
                      ),
                    ),
                    FloatingActionButton.extended(

                      onPressed: () {
                        Cancel(context, widget.details?.orderId);
                      },
                      heroTag: 'Cancel',
                      elevation: 0,
                      backgroundColor: Colors.red[400],
                      label: const Text("Cancel Order"),
                      icon: const Icon(Icons.cancel_outlined),
                    ),



                  ],
                ),
              ),
            ),
          ),

        ]),
      ),
    );
  }

  void Cancel(context, String? orderId) async {
    try {
      CancelOrderUseCase cancelOrderUseCase = getIt<CancelOrderUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      var responseData = await cancelOrderUseCase.invoke(orderId??"");
      if (responseData.isError == false) {

        Navigator.of(context).pop();
        snackBar.showSnackBar(
            context, responseData.message.toString(), Colors.green);
      } else {
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(context, responseData.message.toString(),
            pos: "Ok", postAction: () {
              Navigator.of(context).pop();
            });
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******");
    }
  }

  void setStatus(context, String? orderId,  String? status) async {
    try {
      SetOrderStatusUseCase setOrderStatusUseCase = getIt<SetOrderStatusUseCase>();
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      var responseData = await setOrderStatusUseCase.invoke(orderId??"", status??"");
      if (responseData.isError == false) {

        Navigator.of(context).pop();
        snackBar.showSnackBar(
            context, responseData.message.toString(), Colors.green);
      } else {
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(context, responseData.status.toString(),
            pos: "Ok", postAction: () {
              Navigator.of(context).pop();
            });
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******$e");
    }
  }
}


