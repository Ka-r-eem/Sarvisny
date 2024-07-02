import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class guage extends StatelessWidget {

  double minValue;
  double maxValue;
  String format;



  guage({required this.minValue,required this.maxValue,required this.format});
  @override
  Widget build(BuildContext context) {
    return SfRadialGauge(
          animationDuration: 3000,
          enableLoadingAnimation: true,
          axes: <RadialAxis>[
            RadialAxis(minimum: minValue, showLastLabel: true,maximum:maxValue ,labelFormat: format ,axisLabelStyle: GaugeTextStyle(fontSize: 6 , fontFamily: '2'),showTicks: false, ranges: <GaugeRange>[
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
          ]);

  }
}
