import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lottie/lottie.dart';
import '../../../domain/model/AdminRelatedResponses/GetDistrictsData.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';

class DistrictWidget extends StatelessWidget {
  DistrictData? District;

  DistrictWidget(this.District) {}

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
                    child: Text(District?.districtName ?? "",
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
                )],
            ),
          ),
        ),
      ),
    );
  }
}
