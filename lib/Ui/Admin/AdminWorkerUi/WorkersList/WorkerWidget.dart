import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../../Provider/Provider.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';


class WorkerWidget extends StatefulWidget {
  WorkerListObject? Worker;

  WorkerWidget(this.Worker) {}

  @override
  State<WorkerWidget> createState() => _WorkerWidgetState();
}

class _WorkerWidgetState extends State<WorkerWidget> {
  bool blocked = false;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          blocked == false ?
          SlidableAction(
            onPressed: (context) {
             BlockWorker(context, widget.Worker?.id);
             setState(() {
               blocked = true;

             });

            },
            icon: Icons.block,
            backgroundColor: Colors.red,
            label: "Block",
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ):
          SlidableAction(
            onPressed: (context) {
              UnBlockWorker(context, widget.Worker?.id);
              setState(() {
                blocked = false;

              });

            },
            icon: Icons.lock_open_outlined,
            backgroundColor: Colors.green,
            label: "UnBlock",
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(30)),
          height: MediaQuery.of(context).size.height*0.3,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12 , vertical: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Icon(Icons.person_pin ,  size: 60,color: Colors.white,)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${widget.Worker?.firstName ?? ""}",
                              style: TextStyle(fontSize: 22, color: Colors.white ,fontFamily: "2")),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("${widget.Worker?.lastName ?? ""}",
                              style: TextStyle(fontSize: 22, color: Colors.white , fontFamily: "2")),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Text("Email: ${widget.Worker?.email ?? ""}",
                          style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: "2")),
                      Text(
                        widget.Worker?.isVerified == true ? "State: Verified" : "State: Not Verified",
                        style: const TextStyle(fontSize: 22, color: Colors.white,fontFamily: "2"),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> BlockWorker(context , String? providerID)
  async{

    try {
      ApiManager apiManager = ApiManager() ;
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      print("before assigning the response data");
      var responseData =
      await apiManager.BlockProvider(providerID);
      if (responseData.isError == false) {
        Navigator.of(context).pop();
        provider.IncreaseCart();
        snackBar.showSnackBar(
            context, responseData.message.toString(), Colors.green);
      } else {
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(
            context, responseData.message.toString(), pos: "Ok",
            postAction: () {
              Navigator.of(context).pop();
              print(responseData.payload);
            });
      }

    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******");
    }
  }

  Future<void> UnBlockWorker(context , String? providerID)
  async{

    try {
      ApiManager apiManager = ApiManager() ;
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      print("before assigning the response data");
      var responseData =
      await apiManager.UnBlockProvider(providerID);
      if (responseData.isError == false) {
        Navigator.of(context).pop();
        provider.IncreaseCart();
        snackBar.showSnackBar(
            context, responseData.message.toString(), Colors.green);
      } else {
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(
            context, responseData.message.toString(), pos: "Ok",
            postAction: () {
              Navigator.of(context).pop();
              print(responseData.payload);
            });
      }

    } catch (e) {
      Navigator.of(context).pop();
      print("Error*******");
    }
  }
}
