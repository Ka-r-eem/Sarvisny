import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/MyAccountDetailsCard.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/Provider/ColorProvider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Auth/Login.dart';
import 'package:sarvisny/Ui/Customer/CartUi/MyCartView.dart';
import 'package:shimmer/shimmer.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
    // requests!=null ? notif = true : notif = false;

    var provider = Provider.of<ColorProvider>(context);
    return Scaffold(
      backgroundColor: provider.isDarkEnabled() ? Colors.black : Colors.white54,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
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
              Expanded(
                child: SfRadialGauge(
                  animationDuration: 3000,
                  enableLoadingAnimation: true,
                    // title: GaugeTitle(
                    //     text: 'Rate',
                    //     textStyle: const TextStyle(
                    //         fontSize: 20.0, fontWeight: FontWeight.bold)),
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 0,showTicks: false, showLabels: false,showFirstLabel: true,showLastLabel: true, maximum: 5 ,ranges: <GaugeRange>[
                        GaugeRange(
                          rangeOffset: 2,
                            startValue: 0,
                            endValue: 1,
                            color: Colors.green,
                            startWidth: 5,
                            endWidth: 6),
                        GaugeRange(
                            startValue: 1,
                            endValue: 2,
                            color: Colors.yellow,
                            startWidth: 7,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 2,
                            endValue: 3,
                            color: Colors.orange,
                            startWidth: 12,
                            endWidth: 15),
                        GaugeRange(
                            startValue: 3,
                            endValue: 4,
                            color: Colors.deepOrange,
                            startWidth: 17,
                            endWidth: 17),
                        GaugeRange(
                            startValue: 4,
                            endValue: 5,
                            color: Colors.red,
                            startWidth: 17,
                            endWidth: 20),
                      ], pointers: const <GaugePointer>[

                        // RangePointer(),
                        NeedlePointer(value: 2.9,needleColor: Colors.red , needleEndWidth: 5,)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          horizontalAlignment: GaugeAlignment.center,
                            verticalAlignment: GaugeAlignment.center
                            ,
                            widget: Container(
                                child: const Text('Rate',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 1)
                      ])
                    ]),
              ),
              Expanded(
                child: SfRadialGauge(
                  animationDuration: 3000,
                  enableLoadingAnimation: true,
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 100, showLastLabel: true,maximum:10000 ,labelFormat: '{value} EG' ,axisLabelStyle: GaugeTextStyle(fontSize: 6 , fontFamily: '2'),showTicks: false, ranges: <GaugeRange>[
                        GaugeRange(
                          rangeOffset: 2,
                            startValue: 100,
                            endValue: 500,
                            color: Colors.green,
                            startWidth: 5,
                            endWidth: 7),
                        GaugeRange(
                            startValue: 500,
                            endValue: 1000,
                            color: Colors.yellow,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 1000,
                            endValue: 5000,
                            color: Colors.orange,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 3,
                            endValue: 4,
                            color: Colors.deepOrange,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 5000,
                            endValue: 10000,
                            color: Colors.red,
                            startWidth: 10,
                            endWidth: 10),
                      ], pointers: const <GaugePointer>[
                        RangePointer(value: 3,cornerStyle: CornerStyle.endCurve),
                        // RangePointer(),
                        NeedlePointer(value: 4000,needleColor: Colors.red ,needleEndWidth: 5,)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          horizontalAlignment: GaugeAlignment.center,
                            verticalAlignment: GaugeAlignment.center
                            ,
                            widget: Container(
                                child: const Text('Wallet',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 1)
                      ])
                    ]),
              ),
              Expanded(
                child: SfRadialGauge(
                  animationDuration: 3000,
                  enableLoadingAnimation: true,
                    // title: GaugeTitle(
                    //     text: 'Rate',
                    //     textStyle: const TextStyle(
                    //         fontSize: 20.0, fontWeight: FontWeight.bold)),
                    axes: <RadialAxis>[
                      RadialAxis(minimum: 1,showLastLabel: true,maximum:200 ,axisLabelStyle: GaugeTextStyle(fontSize: 8 , fontFamily: '2'),showTicks: false, ranges: <GaugeRange>[
                        GaugeRange(
                          rangeOffset: 2,
                            startValue: 1,
                            endValue: 10,
                            color: Colors.blue,
                            startWidth: 5,
                            endWidth: 7),
                        GaugeRange(
                            startValue: 10,
                            endValue: 30,
                            color: Colors.green,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 30,
                            endValue: 49,
                            color: Colors.yellow,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 50,
                            endValue: 100,
                            color: Colors.orange,
                            startWidth: 10,
                            endWidth: 10),
                        GaugeRange(
                            startValue: 100,
                            endValue: 200,
                            color: Colors.red,
                            startWidth: 10,
                            endWidth: 10),
                      ], pointers: const <GaugePointer>[
                        RangePointer(value: 3,cornerStyle: CornerStyle.endCurve),
                        // RangePointer(),
                        NeedlePointer(value: 120,needleColor: Colors.red ,needleEndWidth: 5,)
                      ], annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          horizontalAlignment: GaugeAlignment.center,
                            verticalAlignment: GaugeAlignment.center
                            ,
                            widget: Container(
                                child: const Text('Orders',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            angle: 90,
                            positionFactor: 1)
                      ])
                    ]),
              ),

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
