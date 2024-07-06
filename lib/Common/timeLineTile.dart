import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class myTimeLineTile extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final Widget eventCard;

  myTimeLineTile({
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.eventCard,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
          color: isPast ? Colors.lightBlue : Colors.lightBlue.shade100,
        ),
        indicatorStyle: IndicatorStyle(
          width: 40,
          color: isPast ? Colors.lightBlue : Colors.lightBlue.shade100,
          iconStyle: IconStyle(
            iconData: Icons.check,
            color: isPast ? Colors.white : Colors.lightBlue.shade100,
          ),
        ),
        endChild: eventCard,
      ),
    );
  }
}
