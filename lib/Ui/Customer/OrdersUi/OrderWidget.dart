import 'package:flutter/material.dart';
import 'package:sarvisny/Ui/Customer/OrdersUi/CustomerOrderDetailsScreen.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';

class CustomerOrderWidget extends StatelessWidget {
  CustomerOrderPayload details;

  CustomerOrderWidget(this.details);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, CustomerOrderDetailsScreen.routeName,
            arguments: details);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Theme.of(context).colorScheme.primary),
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      "Worker: ${details.orderService?.first.firstName}" ??
                          "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text("Status: ${details.orderStatus}" ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                  Text(
                      "Date: ${details.orderDate?.substring(0, 10)}",
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ],
              ),
              const Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
