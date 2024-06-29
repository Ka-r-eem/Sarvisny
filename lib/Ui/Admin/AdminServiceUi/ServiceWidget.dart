import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';

class ServiceWidget extends StatelessWidget {
  ServiceObject? Service;

  ServiceWidget(this.Service) {}

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
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Card(
          elevation: 30,
          shadowColor: Theme.of(context).colorScheme.primary,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.14,
                    child: LottieBuilder.network(Service?.serviceName
                                    ?.contains("Car") ==
                                true ||
                            Service?.criteriaName?.contains("Car") == true
                        ? "https://lottie.host/0d8e4b9a-ca51-4e76-b765-54b3335bcfcc/hxlhtPRlW2.json"
                        : Service?.serviceName?.contains("Home") == true ||
                                Service?.criteriaName?.contains("Home") == true
                            ? "https://lottie.host/d52906ab-4c2e-4cea-a398-2405764e4222/Y5gmEXamX1.json"
                            : "https://lottie.host/a0b6d263-cd88-4d4d-b124-57bd31bf18cf/YG0B7SjofD.json")),
                Text(Service?.serviceName ?? "",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "2",
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).colorScheme.primary)),
                // Text(Service?.criteriaName??"",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontFamily: "2",
                //         fontWeight: FontWeight.w700,
                //         color: Theme.of(context).colorScheme.primary)),
                // Text(Service?.availabilityStatus??"",
                //     style: TextStyle(
                //         fontSize: 20,
                //         fontFamily: "2",
                //         fontWeight: FontWeight.w700,
                //         color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
