import 'package:flutter/material.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import 'SlotWidget.dart';

class DayOfWeekSlotWidget extends StatelessWidget {

  WorkerSlots? DaySlot;

  DayOfWeekSlotWidget({this.DaySlot});


  @override
  Widget build(BuildContext context) {
    return Card(

      elevation: 20,
      surfaceTintColor: Theme.of(context).colorScheme.primary,
      shadowColor: Colors.white,
     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: Theme.of(context).colorScheme.primary,width: 2)),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: 200,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(DaySlot?.dayOfWeek??"",style: TextStyle(fontSize: 25 , fontFamily: '2',color: Theme.of(context).colorScheme.primary),),
                Text(DaySlot?.availabilityDate?.substring(0,10)??"",style: TextStyle(fontSize: 25 , fontFamily: '2',color: Theme.of(context).colorScheme.primary),),

              ],
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => SlotsWidget(DaySlot?.slots?[index]),itemCount:DaySlot?.slots?.length ,),
            )

          ],
        ),
      ),
    );
  }
}
