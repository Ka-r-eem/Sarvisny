import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import '../../../../Provider/Provider.dart';
import '../../../../di/di.dart';
import '../../../../domain/UseCases/WorkerUseCases/RemoveAvailabilityUseCase.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import 'SlotWidget.dart';

class DayOfWeekSlotWidget extends StatelessWidget {
  final WorkerSlots? daySlot;

  DayOfWeekSlotWidget({this.daySlot});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        dialoguUtilities.showmsg(context, "Do You Want To Delete ${daySlot?.dayOfWeek}?", postAction:() {
          _slotDeletion(context, daySlot?.providerAvailabilityID);
        },
        pos: "Yes", txt: "No");
      },
      child: Card(
        elevation: 20,
        surfaceTintColor: Theme.of(context).colorScheme.primary,
        shadowColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          height: 200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    daySlot?.dayOfWeek ?? "",
                    style: TextStyle(fontSize: 25, fontFamily: '2', color: Theme.of(context).colorScheme.primary),
                  ),
                  Text(
                    daySlot?.availabilityDate?.substring(0, 10) ?? "",
                    style: TextStyle(fontSize: 25, fontFamily: '2', color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SlotsWidget(daySlot?.slots?[index]),
                  itemCount: daySlot?.slots?.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _showSlotMenu(BuildContext context, String? availabilityID) async {
  //   final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  //   final RenderBox renderBox = context.findRenderObject() as RenderBox;
  //   final Offset position = renderBox.localToGlobal(Offset.zero);
  //
  //   await showMenu(
  //     context: context,
  //     position: RelativeRect.fromLTRB(
  //       position.dx,
  //       position.dy - renderBox.size.height,
  //       overlay.size.width - position.dx - renderBox.size.width,
  //       overlay.size.height - position.dy,
  //     ),
  //     items: [
  //       PopupMenuItem(
  //         value: 'delete',
  //         child: Text('Delete'),
  //       ),
  //     ],
  //   ).then((value) {
  //     if (value == 'delete') {
  //       _slotDeletion(context, availabilityID);
  //     }
  //   });
  // }

  Future<void> _slotDeletion(BuildContext context, String? availabilityID) async {
    try {
      RemoveAvailabilityUseCase removeAvailability = getIt<RemoveAvailabilityUseCase>();
      var provider = Provider.of<AppProvider>(context, listen: false);
      dialoguUtilities.loadingDialog(context, "Please Wait...");
      var responseData = await removeAvailability.invoke(provider.UserId, availabilityID);
      if (responseData.isError == false) {
        print("Entering isError");
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        snackBar.showSnackBar(context, "Availability Deleted Successfully", Colors.green);
      } else {
        print("Entering Else");
        Navigator.of(context).pop();
        dialoguUtilities.showmsg(context, responseData.message.toString(), pos: "Ok", postAction: () {
          Navigator.of(context).pop();
        });
      }
    } catch (e) {
      Navigator.of(context).pop();
      print("Error******* $e");
    }
  }
}
