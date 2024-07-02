import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/ColorProvider.dart';

class DateDropdown extends StatefulWidget {
  final Function(DateTime) onDateChanged;
  final int weekday;

  DateDropdown({required this.onDateChanged, required this.weekday});

  @override
  _DateDropdownState createState() => _DateDropdownState();
}

class _DateDropdownState extends State<DateDropdown> {
  DateTime? selectedDate;
  List<DateTime> dates = [];

  @override
  void initState() {
    super.initState();
    dates = getNextFourDates(widget.weekday);
    selectedDate = dates[0];
    widget.onDateChanged(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);



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
          child: DropdownButton<DateTime>(
            onTap: () {
              print('Dropdown button tapped');
            },
            dropdownColor: color.isDarkEnabled() ? Colors.black : Colors.white,
            isExpanded: true,
            alignment: Alignment.center,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "2",
              color: Colors.grey,
            ),
            value: selectedDate,
            onChanged: (newValue) {
              setState(() {
                selectedDate = newValue!;
              });
              widget.onDateChanged(newValue!);
            },
            items: dates.map((DateTime date) {
              return DropdownMenuItem<DateTime>(
                value: date,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: color.isDarkEnabled() ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  child: Text(
                    date.toIso8601String().substring(0, 10),
                    style: TextStyle(
                      color: color.isDarkEnabled() ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

List<DateTime> getNextFourDates(int weekday) {
  DateTime today = DateTime.now();
  List<DateTime> dates = [];
  for (int i = 0; i < 28; i++) {
    DateTime date = today.add(Duration(days: i));
    if (date.weekday == weekday) {
      dates.add(date);
      if (dates.length == 4) break;
    }
  }
  return dates;
}
