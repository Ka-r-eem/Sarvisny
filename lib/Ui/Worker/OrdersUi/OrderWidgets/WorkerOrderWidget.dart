import 'package:flutter/material.dart';
import '../../../../domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
import 'OrderDetailsWidget.dart';


class WorkerOrderWidget extends StatelessWidget {

  orderDetails? order;
  WorkerOrderWidget(this.order);

  @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap:() {
         Navigator.pushNamed(context, OrderDetailsWidget.routeName ,  arguments: order?.orderId);
       },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8 ,horizontal: 4),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4,),
                    Text("Name: ${order?.customerFN} ${order?.customerFN}"??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
                    Text("Status: ${order?.orderStatus}" ??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
                    Text("Date: ${order?.orderDate?.substring(0,10)}" ??"", style: const TextStyle(fontSize: 20 ,fontFamily: "2",fontWeight: FontWeight.w700,color: Colors.white)),
                     ],
                ),
              ),
              Icon(Icons.navigate_next_rounded , color: Colors.white ,size: 40,)
            ],
          ),
        ),
      ),
    );
  }
}

