import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomersListResponse.dart';


class CustomerWidget extends StatelessWidget {

  CustomerListObject? Customer ;
  CustomerWidget(this.Customer){}


  @override
  Widget build(BuildContext context) {
    return Slidable(
          startActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {},
                icon: Icons.delete,
                backgroundColor: Colors.red,
                label: "Delete",
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
            ],
          ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12)),
          height: 120,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,

                ),
                height: 100,
                width: 100,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: const Icon(Icons.person, size: 50),
              ),
               Expanded(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Customer?.firstName??"",
                            style: const TextStyle(fontSize: 22, color: Colors.white)),
                    const SizedBox(width: 4,),
                        Text(Customer?.lastName??"",
                            style: const TextStyle(fontSize: 22, color: Colors.white)),
                      ],
                    ),
                    Text(Customer?.email??"",
                        style: const TextStyle(fontSize: 15, color: Colors.white)),
                  ],
                               ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
