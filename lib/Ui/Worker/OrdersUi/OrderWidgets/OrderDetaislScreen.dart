import 'package:flutter/material.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/ApproveOrderUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/CancelOrderUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/RejectOrderUseCase.dart';

import '../../../../data/API/apiManager.dart';
import '../../../../di/di.dart';
import '../../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'OrderSingleServiceWidget.dart';

class OrderDetailsScreen extends StatefulWidget {
  orderDetails? details;

  OrderDetailsScreen({this.details});

  bool canceled = false;
  bool approved = false;
  bool rejected = false;
  bool completed = false;
  bool pending = true;


  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {

  @override
  void initState() {
    widget.details?.orderStatus == "Canceled"
        ? widget.canceled = true
        : widget.canceled = false;
    widget.details?.orderStatus == "Pending"
        ? widget.pending = true
        : widget.pending = false;
    widget.details?.orderStatus == "Approved"
        ? widget.approved = true
        : widget.approved = false;
    widget.details?.orderStatus == "Rejected"
        ? widget.rejected = true
        : widget.rejected = false;
    widget.details?.orderStatus == "Completed"
        ? widget.completed = true
        : widget.completed = false;
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Customer Name: ${widget.details?.customerFN} ${widget.details?.customerLN}",
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
                    Expanded(
                      child: Padding(
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
                    ),
                    Text("Total Price: ${widget.details?.orderPrice} EGP",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 22,
                            fontFamily: '2')),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: widget.pending,
                  child: Row(
                    children: [
                      InkWell(
                          // onTap: () async {
                          //   await Approve(context, widget.details?.orderId);
                          //   setState(() {
                          //     widget.pending = false;
                          //     widget.approved = true;
                          //   });
                          // },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child:
                                  // widget.task.isDone!?
                                  const Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ))),
                      InkWell(
                          // onTap: () {
                          //   Reject(context, widget.details?.orderId);
                          //   setState(() {
                          //     widget.pending = false;
                          //     widget.rejected = true;
                          //   });
                          // },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child:
                                  // widget.task.isDone!?
                                  const Text(
                                "Reject",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ],
                  )),
              Visibility(
                  visible: widget.approved,
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Cancel(context, widget.details?.orderId);
                            setState(() {
                              widget.approved = false;
                              widget.canceled = true;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child:
                                  // widget.task.isDone!?
                                  const Text(
                                "Cancel",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ],
                  )),
              Visibility(
                  visible: widget.canceled,
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:
                              // widget.task.isDone!?
                              const Text(
                            "Canceled",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
              Visibility(
                  visible: widget.rejected,
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:
                              // widget.task.isDone!?
                              const Text(
                            "Rejected",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
              Visibility(
                  visible: widget.completed,
                  child: Row(
                    children: [
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:
                              // widget.task.isDone!?
                              const Text(
                            "Completed",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  )),
            ],
          )
        ]),
      ),
    );
  }
}

// Future<void> Approve(context, String? orderId) async {
//   try {
//     ApproveOrderUseCase approveOrderUseCase = getIt<ApproveOrderUseCase>();
//     dialoguUtilities.loadingDialog(context, "Please Wait...");
//     var responseData = await approveOrderUseCase.invoke(orderId??"");
//     if (responseData.isError == false) {
//       Navigator.of(context).pop();
//       snackBar.showSnackBar(
//           context, responseData.message.toString(), Colors.green);
//     } else {
//       Navigator.of(context).pop();
//       dialoguUtilities.showmsg(context, responseData.message.toString(),
//           pos: "Ok", postAction: () {
//         Navigator.of(context).pop();
//       });
//     }
//   } catch (e) {
//     Navigator.of(context).pop();
//     print("Error*******");
//   }
// }
//
// void Reject(context, String? orderId) async {
//   try {
//     RejectOrderUseCase rejectOrderUseCase = getIt<RejectOrderUseCase>();
//     dialoguUtilities.loadingDialog(context, "Please Wait...");
//     var responseData = await rejectOrderUseCase.invoke(orderId??"");
//     if (responseData.isError == false) {
//       Navigator.of(context).pop();
//       snackBar.showSnackBar(
//           context, responseData.message.toString(), Colors.green);
//     } else {
//       Navigator.of(context).pop();
//       dialoguUtilities.showmsg(context, responseData.message.toString(),
//           pos: "Ok", postAction: () {
//         Navigator.of(context).pop();
//       });
//     }
//   } catch (e) {
//     Navigator.of(context).pop();
//     print("Error*******");
//   }
// }

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
