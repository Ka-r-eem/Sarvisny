import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/domain/UseCases/AdminUseCases/GetChildrenForServiceUseCase.dart';
import 'package:sarvisny/domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriaData.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../Provider/ColorProvider.dart';
import '../../di/di.dart';
import '../../domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

class CriteriasDropDown extends StatefulWidget {
  final Function(CriteriaObject?) onCriteriaChanged;


  CriteriasDropDown({required this.onCriteriaChanged});

  @override
  State<CriteriasDropDown> createState() => _CriteriaDropDownState();
}

class _CriteriaDropDownState extends State<CriteriasDropDown> {
  CriteriaObject? criteriaChoosen;

  @override
  Widget build(BuildContext context) {
     ShowAllCriteriasUseCase showAllCriteriasUseCase = getIt<ShowAllCriteriasUseCase>();
    var color = Provider.of<ColorProvider>(context);

    return FutureBuilder<List<CriteriaObject>?>(
      future: showAllCriteriasUseCase.invoke(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Column(
              children: [
                Text(snapshot.error.toString()),
                ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
              ],
            ),
          );
        } else if (snapshot.hasData) {
          var criteriaList = snapshot.data;

          if (criteriaList == null || criteriaList == []) {
            return const Center(child: Text('No Criteria available'));
          }

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
                    DropdownButton(
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
                        "Select SubService",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontFamily: "2",
                        ),
                      ),
                      value: criteriaChoosen?.criteriaID,
                      onChanged: (newValue) {
                        setState(() {
                          criteriaChoosen = criteriaList.firstWhere(
                                  (criteria) => criteria.criteriaID == newValue,
                              orElse: () => CriteriaObject(
                                criteriaID: ""
                              )
                          );
                          widget.onCriteriaChanged(criteriaChoosen);
                        });
                      },
                      items: criteriaList.map((criteria) {
                        return DropdownMenuItem(
                          value: criteria.criteriaID,
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
                              "${criteria.criteriaName}",
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
        } else {
          return const Center(child: Text('Unexpected error'));
        }
      },
    );
  }
}
