import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../di/di.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';

class CriteriasDropDown extends StatefulWidget {
  final Function(CriteriaObject?) onCriteriaChanged;
  List<CriteriaObject>? criteriaList ;
  CriteriasDropDown({required this.onCriteriaChanged , required this.criteriaList});

  @override
  State<CriteriasDropDown> createState() => _CriteriasDropDownState();
}

class _CriteriasDropDownState extends State<CriteriasDropDown> {
  CriteriaObject? criteriaChoosen;

  @override
  Widget build(BuildContext context) {
    var color = Provider.of<ColorProvider>(context);

    // return FutureBuilder(
    //   future:showAllCriteriasUseCase.invoke(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     var criteriaList = snapshot.data;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff3a8bc8)),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DropdownButton(
                    onTap: () {
                      print('Dropdown button tapped');
                    },
                    dropdownColor: Theme.of(context).colorScheme.onSecondary,
                    isExpanded: true,
                    alignment: Alignment.center,
                    style: const TextStyle(
                        fontSize: 18, fontFamily: "2", color: Colors.grey),
                    hint: const Text("Select Criteria",
                        style: TextStyle(
                            fontSize: 22, color: Colors.grey, fontFamily: "2")),
                    value: criteriaChoosen?.criteriaID,
                    onChanged: (newValue) {
                      setState(() {
                        criteriaChoosen = widget.criteriaList?.firstWhere(
                          (criteria) => criteria.criteriaID == newValue,
                          orElse: () => CriteriaObject(
                              criteriaID: null,
                              criteriaName: null,
                              description: null),
                        );
                        widget.onCriteriaChanged(criteriaChoosen);
                      });
                    },
                    items: widget.criteriaList?.map((criteria) {
                      return DropdownMenuItem(
                        value: criteria.criteriaID,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: color.isDarkEnabled() == true
                                            ? Colors.white
                                            : Colors.black))),
                            child: Text("${criteria.criteriaName}",
                                style: TextStyle(
                                    color: color.isDarkEnabled() == true
                                        ? Colors.white
                                        : Colors.black))),
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
