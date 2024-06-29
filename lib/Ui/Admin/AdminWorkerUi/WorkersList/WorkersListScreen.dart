import 'package:flutter/material.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';
import 'WorkerWidget.dart';


class WorkersListScreen extends StatelessWidget {

  List<WorkerListObject>? WorkersList ;

  WorkersListScreen({this.WorkersList}){}


  static const String routeName = "AdminWorkersList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8 , horizontal: 4),
            child: Text("All Service Providers",
                style: TextStyle(fontSize: 25, color: Theme
                    .of(context)
                    .colorScheme
                    .primary, fontFamily: "2", fontWeight: FontWeight.bold)),
          ),
          Expanded(child: ListView.builder(
            itemBuilder: (context, index) => WorkerWidget(WorkersList?[index]), itemCount: WorkersList?.length,))
        ],
      ),

    );
  }
}
