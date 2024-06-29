import 'package:flutter/material.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';
import 'RequestWidget.dart';

class WorkersRequestsListScreen extends StatelessWidget {

  List<WorkerRequest>? Requests ;

  WorkersRequestsListScreen({this.Requests}){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("REQUESTS", style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily: "2",color:Theme.of(context).colorScheme.primary)),
            Expanded(
              child:Requests?.length == 0 ? Center(
                child: Text("NO Requests For Today",style: TextStyle(color:Theme.of(context).colorScheme.primary , fontFamily: '2' )),
              ): ListView.builder(itemBuilder: (context, index) =>RequestWidget(Requests?[index]) ,itemCount: Requests?.length),
            ),
          ],
        ),
      ),
    );
  }

}
