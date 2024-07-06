import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Provider/ColorProvider.dart';

class WeekdayDropDown extends StatefulWidget {
  final Function(String?) onDayChanged;
  String? selectedDay;

  WeekdayDropDown({required this.onDayChanged, this.selectedDay});

  @override
  _WeekdayDropDownState createState() => _WeekdayDropDownState();
}

class _WeekdayDropDownState extends State<WeekdayDropDown> {
  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);

    List<String> daysOfWeek = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];

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
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "2",
                  color: Colors.grey,
                ),
                hint: const Text(
                  "Select Day",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontFamily: "2",
                  ),
                ),
                value: widget.selectedDay,
                onChanged: (newValue) {
                  setState(() {
                    widget.selectedDay = newValue;
                    widget.onDayChanged(newValue);
                  });
                },
                items: daysOfWeek.map((day) {
                  return DropdownMenuItem<String>(
                    value: day,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: color.isDarkEnabled() == true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                      child: Text(
                        day,
                        style: TextStyle(
                          color: color.isDarkEnabled() == true
                              ? Colors.white
                              : Colors.black,
                        ),
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
