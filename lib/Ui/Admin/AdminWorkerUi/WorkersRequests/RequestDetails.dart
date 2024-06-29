import 'package:flutter/material.dart';

import '../../../../data/API/apiManager.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';


class RequestDetailsScreen extends StatefulWidget {
  static const String routeName = "RequestDetails";

  @override
  State<RequestDetailsScreen> createState() => _RequestDetailsScreenState();
}

class _RequestDetailsScreenState extends State<RequestDetailsScreen> {
  bool Pending = true;

  bool Approved = false;

  bool Rejected = false;

  @override
  Widget build(BuildContext context) {
    var Request = ModalRoute.of(context)?.settings.arguments as WorkerRequest;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Service Provider Request",
            style: TextStyle(color: Colors.blue)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.blue, width: 2))),
                    child: const Text("Request Details",
                        style: TextStyle(
                            color: Colors.blue, fontSize: 30, fontFamily: "1")),
                  )),
                  Text("User ID: ${Request.id}",
                      style: const TextStyle(fontSize: 25)),
                  Text("Name: ${Request.firstName} ${Request.lastName}",
                      style: const TextStyle(fontSize: 25)),
                  Text("Phone: ${Request.phoneNumber}",
                      style: const TextStyle(fontSize: 25)),
                  Text("Username: ${Request.userName}",
                      style: const TextStyle(fontSize: 25)),
                  Text("Email: ${Request.email}",
                      style: const TextStyle(fontSize: 25)),
                  Text(
                      Request.isVerified == true
                          ? "State: Verified"
                          : "State: Not Verified",
                      style: const TextStyle(fontSize: 25)),
                  Text("Access Failed Count: ${Request.accessFailedCount}",
                      style: const TextStyle(fontSize: 25)),
                  Text(
                      Request.emailConfirmed == true
                          ? "Email Confirmed"
                          : "Email Not Confirmed",
                      style: const TextStyle(fontSize: 25)),
                  Text(
                      Request.phoneNumberConfirmed == true
                          ? "Phone Number Confirmed"
                          : "Phone Number Not Confirmed",
                      style: const TextStyle(fontSize: 25)),
                  Text(
                      Request.twoFactorEnabled == true
                          ? "Two Factor Enabled"
                          : "Two Factor Not Enabled",
                      style: const TextStyle(fontSize: 25)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible: Pending,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Accept(Request.id);
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 24),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: const Text(
                                        "Accept",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      )
                                      //:  Icon(
                                      //Icons.check,
                                      //size: 30,
                                      //color: Theme.of(context).colorScheme.secondary,
                                      )),
                            ),
                            Visibility(
                              visible: Pending,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      Reject(Request.id);
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 24),
                                      decoration: BoxDecoration(
                                        color:
                                            // widget.task.isDone!
                                            // ? Colors.white :
                                            Colors.red,
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
                                      )
                                      //:  Icon(
                                      //Icons.check,
                                      //size: 30,
                                      //color: Theme.of(context).colorScheme.secondary,
                                      )),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Visibility(
                              visible: Approved,
                              child: Expanded(
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 24),
                                    decoration: BoxDecoration(
                                      color:
// widget.task.isDone!
// ? Colors.white :
                                          Colors.green,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child:
// widget.task.isDone!?
                                        const Text(
                                      "Approved",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    )
//:  Icon(
//Icons.check,
//size: 30,
//color: Theme.of(context).colorScheme.secondary,
                                    ),
                              ),
                            ),
                            Visibility(
                              visible: Rejected,
                              child: Expanded(
                                child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 24),
                                    decoration: BoxDecoration(
                                      color:
// widget.task.isDone!
// ? Colors.white :
                                          Colors.red,
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
                                      textAlign: TextAlign.center,
                                    )
//:  Icon(
//Icons.check,
//size: 30,
//color: Theme.of(context).colorScheme.secondary,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void Accept(WorkerID) {
    ApiManager apiManager = ApiManager() ;
    apiManager.ApproveWorker(WorkerID);
    Pending = false;
    Approved = true;
  }

  void Reject(WorkerID) {
    ApiManager apiManager = ApiManager() ;
    apiManager.RejectWorker(WorkerID);
    Pending = false;
    Rejected = true;
  }
}
