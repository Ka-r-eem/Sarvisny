import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../di/di.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';

class ParentsDropDown extends StatefulWidget {
  final Function(ParentService?) onParentChanged;
  List<ParentService>? parentsList;
  ParentsDropDown({required this.onParentChanged , required this.parentsList});

  @override
  State<ParentsDropDown> createState() => _ParentsDropDownState();
}

class _ParentsDropDownState extends State<ParentsDropDown> {
  ParentService? ParentChoosen;

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
                    hint: const Text("Select Main Service",
                        style: TextStyle(
                            fontSize: 22, color: Colors.grey, fontFamily: "2")),
                    value: ParentChoosen?.serviceId,
                    onChanged: (newValue) {
                      setState(() {
                        ParentChoosen = widget.parentsList?.firstWhere(
                          (parent) => parent.serviceId == newValue,
                          orElse: () => ParentService(
                            criteriaID: ""
                          )
                        );
                        widget.onParentChanged(ParentChoosen);
                      });
                    },
                    items: widget.parentsList?.map((parent) {
                      return DropdownMenuItem(
                        value: parent.serviceId,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: color.isDarkEnabled() == true
                                            ? Colors.white
                                            : Colors.black))),
                            child: Text("${parent.serviceName}",
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
