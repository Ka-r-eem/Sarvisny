import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/domain/UseCases/AdminUseCases/GetChildrenForServiceUseCase.dart';
import '../../../Provider/ColorProvider.dart';
import '../../../di/di.dart';
import '../../../domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

class ChildrenDropDown extends StatefulWidget {
  final Function(Children?) onChildChanged;
  String? parentServiceID;

  ChildrenDropDown({required this.onChildChanged , required this.parentServiceID});

  @override
  State<ChildrenDropDown> createState() => _ChildrenDropDownState();
}

class _ChildrenDropDownState extends State<ChildrenDropDown> {
  Children? childChoosen;

  @override
  Widget build(BuildContext context) {
    GetChildrenUseCase getChildrenUseCase = getIt<GetChildrenUseCase>();
    var color = Provider.of<ColorProvider>(context);

    return FutureBuilder<ChildrenServicesResponse>(
      future: getChildrenUseCase.invoke(widget.parentServiceID),
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
          var childrenList = snapshot.data?.payload?.children;

          if (childrenList == null || childrenList == []) {
            return const Center(child: Text(''));
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
                      value: childChoosen?.childServiceID,
                      onChanged: (newValue) {
                        setState(() {
                          childChoosen = childrenList.firstWhere(
                                (child) => child.childServiceID == newValue,
                            orElse: () => Children(
                              childServiceID: ""
                            )
                          );
                          widget.onChildChanged(childChoosen);
                        });
                      },
                      items: childrenList.map((child) {
                        return DropdownMenuItem(
                          value: child.childServiceID,
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
                              "${child.childServiceName}",
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
