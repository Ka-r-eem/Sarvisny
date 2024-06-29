import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Ui/Admin/AdminWorkerUi/WorkersRequests/RequestDetails.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../domain/model/CustomerRelatedResponses/AddToCartResponse.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';


class RequestWidget extends StatefulWidget {
  WorkerRequest? request;

  RequestWidget(this.request);

  bool Pending = true;
  bool Approved = false;
  bool Rejected = false;

  @override
  State<RequestWidget> createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {


  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              Reject(widget.request?.id);

            },
            icon: Icons.block,
            backgroundColor: Colors.red,
            label: "Reject",
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
                width: 4,
                height: 64,
                decoration: BoxDecoration(
                  color: //widget.task.isDone!
                      //? Color(0xFF61E757):
                      Colors.white,
                  borderRadius: BorderRadius.circular(18),
                )),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // widget.task.title ??
                    "${widget.request?.userName}",
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color:
                            //widget.task.isDone!
                            //  ? Color(0xFF61E757) :
                            Colors.white),
                  ),
                  Text(
                    // widget.task.description ??
                    "${widget.request?.phoneNumber}",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            )),
            Row(
              children: [
                Visibility(
                  visible: widget.Pending,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RequestDetailsScreen.routeName,
                            arguments: widget.request ,

                        );
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child:
                              // widget.task.isDone!?
                              const Text(
                            "Details",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          )
                          )),
                ),
                const SizedBox(
                  width: 4,
                ),
                Visibility(
                  visible: widget.Pending,
                  child: InkWell(
                    onTap: () {
                      ApiManager apiManager = ApiManager() ;
                      apiManager.ApproveWorker(widget.request?.id);
                      snackBar.showSnackBar(context, "Request Approved", Colors.green);
                      setState(() {
                        widget.Pending = false;
                        widget.Approved = true;
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                        )),
                  ),
                ),
                Visibility(
                  visible: widget.Approved,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text("Approved",
                          style: TextStyle(fontSize: 22, color: Colors.white))),
                ),
                Visibility(
                  visible: widget.Rejected,
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Text("Rejected",
                          style: TextStyle(fontSize: 22, color: Colors.white))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void Reject(WorkerID) {
    ApiManager apiManager = ApiManager() ;
    dialoguUtilities.showmsg(context, "Reject This Request ? ",
        pos: "YES", txt: "Cancel", postAction: () {
      apiManager.RejectWorker(WorkerID);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
          content: Text('Swipe Down to Refresh Requests'),
          duration: Duration(seconds: 2),));
      setState(() {
        widget.Pending = false;
        widget.Rejected = true;
      });
    });
  }

}
