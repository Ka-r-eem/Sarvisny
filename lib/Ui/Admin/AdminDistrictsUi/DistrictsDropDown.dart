import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../di/di.dart';
import '../../../domain/UseCases/AdminUseCases/GetAllDistrictsUseCase.dart';
import '../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/model/AdminRelatedResponses/GetDistrictsData.dart';

class DistrictsDropDown extends StatefulWidget {
  final Function(DistrictData?) onDistrictChanged;
  DistrictsDropDown({required this.onDistrictChanged});

  @override
  State<DistrictsDropDown> createState() => _DistrictsDropDownState();
}

class _DistrictsDropDownState extends State<DistrictsDropDown> {
  DistrictData? districtChoosen;

  @override
  Widget build(BuildContext context) {
    GetAllDistrictsUseCase getAllDistrictsUseCase = getIt<GetAllDistrictsUseCase>();
    var color = Provider.of<ColorProvider>(context);

    return FutureBuilder<GetDistrictsData>(
      future: getAllDistrictsUseCase.invoke(),
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
        }
        var districtsList =  snapshot.data?.payload;



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
                    hint: const Text("Select District",
                        style: TextStyle(
                            fontSize: 22, color: Colors.grey, fontFamily: "2")),
                    value: districtChoosen?.districtID,
                    onChanged: (newValue) {
                      setState(() {
                        districtChoosen = districtsList?.firstWhere(
                          (district) => district.districtID == newValue,
                          orElse: () => DistrictData(
                            districtID: "",
                          ),
                        );
                        widget.onDistrictChanged(districtChoosen);
                      });
                    },
                    items: districtsList?.map((district) {
                      return DropdownMenuItem(
                        value: district.districtID,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: color.isDarkEnabled() == true
                                            ? Colors.white
                                            : Colors.black))),
                            child: Text("${district.districtName}",
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
      },
    );
  }
}
