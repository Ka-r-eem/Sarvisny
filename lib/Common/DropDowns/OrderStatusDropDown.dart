import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/ColorProvider.dart';

class OrderStatusDropDown extends StatefulWidget {
  final Function(String?) onStatusChanged;
  String currentStatus;


  OrderStatusDropDown({required this.onStatusChanged , required this.currentStatus});

  @override
  State<OrderStatusDropDown> createState() => _OrderStatusDropDownState();
}

class _OrderStatusDropDownState extends State<OrderStatusDropDown> {
  String? statusChosen;

  static const List<String> orderStatuses = [
    "Pending",
    "CanceledByProvider",
    "ReAssigned",
    "Canceled",
    "Refunded",
    "RemovedWithRefund",
    "Paid",
    "Start",
    "Preparing",
    "OnTheWay",
    "InProgress",
    "Done",
    "Completed",
    "Removed"
  ];

  @override
  Widget build(BuildContext context) {
    var colorProvider = Provider.of<ColorProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff3a8bc8)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton<String>(
                onTap: () {
                  print('Dropdown button tapped');
                },
                dropdownColor: Theme.of(context).colorScheme.onSecondary,
                isExpanded: true,
                alignment: Alignment.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "2",
                  color: colorProvider.isDarkEnabled() ? Colors.white : Colors.black,
                ),
                hint: Text(
                  widget.currentStatus,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontFamily: "2",
                  ),
                ),
                value: statusChosen,
                onChanged: (newValue) {
                  setState(() {
                    statusChosen = newValue;
                    widget.onStatusChanged(newValue);
                  });
                },
                items: orderStatuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status,
                    child: Text(
                      status,
                      style: TextStyle(
                        color: colorProvider.isDarkEnabled() ? Colors.white : Colors.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
