import 'package:flutter/material.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import 'OrderWidgets/WorkerOrderWidget.dart';

class WorkerOrdersListScreen extends StatefulWidget {
  List<OutSidePayload>? ordersList;

  WorkerOrdersListScreen({Key? key, this.ordersList}) : super(key: key);

  @override
  State<WorkerOrdersListScreen> createState() => _WorkerOrdersListScreenState();
}

class _WorkerOrdersListScreenState extends State<WorkerOrdersListScreen> {
  var keyform = GlobalKey<FormState>();
  ServiceObject? selectedService;

  @override
  Widget build(BuildContext context) {
    return
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child:
                  widget.ordersList?.length == 0 || widget.ordersList == null? Center(child: Text("No Orders Found" ,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)):
                  ListView.builder(
                    itemBuilder: (context, index) =>
                        WorkerOrderWidget(widget.ordersList?[index].payload),
                    itemCount: widget.ordersList?.length,

                  ),
                ),
              ],
            ),
          );
  }
}
