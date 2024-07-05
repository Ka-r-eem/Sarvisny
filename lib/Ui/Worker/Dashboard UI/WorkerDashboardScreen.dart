import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Common/guage.dart';
import 'package:sarvisny/Provider/ColorProvider.dart';
import 'package:shimmer/shimmer.dart';
import '../../../domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../MyAccountUi/Slots/SlotsListWidget.dart';

class WorkerDashboardScreen extends StatelessWidget {
  final WorkerPersonalDetails? details;
  final List<OutSidePayload>? requests;

  WorkerDashboardScreen({this.details, this.requests});

  @override
  Widget build(BuildContext context) {

    bool notif = true;
    requests!=null ? notif = true : notif = false;

    var provider = Provider.of<ColorProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDarkEnabled() ? Colors.black : Colors.white54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Ahlan ${details?.firstName},',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary)),),
          Visibility(
            visible: notif,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: FloatingActionButton.extended(
                onPressed: () {},
                heroTag: 'You Have New Requests !',
                elevation: 3,
                backgroundColor: Colors.red,
                label: Shimmer.fromColors(
                  baseColor: Colors.transparent,
                  highlightColor: Colors.black,
                  period: Duration(seconds: 5),
                  child: const Text(
                    "You May have New Request",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
          ),
          Seperator(),
          Center(child: Text("Your Statistics",style: TextStyle(fontFamily: '2',fontSize: 25,color: Theme.of(context).colorScheme.primary),))
,
          Row(
            children: [
              Expanded(child: guage(GuageValue: details?.avgCustomerRate??0,GuageName: "Ratings",minValue: 0 , maxValue: 5, format: '{value}')),
              Expanded(child: guage(GuageValue: details?.wallet?.totalBalance?.toDouble()??0,GuageName: "Wallet",minValue: 100 , maxValue: 10000, format: '{value} EG')),
              Expanded(child: guage(GuageValue: details?.completedOrdersCount?.toDouble(), GuageName: "Orders",minValue: 1 , maxValue: 200, format: '{value}')),

            ],
          ),
          Seperator(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, SlotsListWidget.routeName);

              },
              heroTag: 'Slots',
              elevation: 3,
              backgroundColor: Colors.green,
              label: const Text(
                "Manage Availability",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
