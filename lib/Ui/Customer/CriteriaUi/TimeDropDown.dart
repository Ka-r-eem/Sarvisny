import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/ColorProvider.dart';

class TimeDropDown extends StatefulWidget {
  final Function(String?) onTimeChanged;

  TimeDropDown({required this.onTimeChanged});

  @override
  State<TimeDropDown> createState() => _TimeDropDownState();
}

class _TimeDropDownState extends State<TimeDropDown> {
  String? timeChoosen;

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
                hint: const Text(
                  "Select Time",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.grey,
                    fontFamily: "2",
                  ),
                ),
                value: timeChoosen,
                onChanged: (newValue) {
                  setState(() {
                    timeChoosen = newValue;
                    widget.onTimeChanged(newValue);
                  });
                },
                items: List.generate(24, (index) {
                  final time = '${index.toString().padLeft(2, '0')}:00';
                  return DropdownMenuItem<String>(
                    value: time,
                    child: Text(
                      time,
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
