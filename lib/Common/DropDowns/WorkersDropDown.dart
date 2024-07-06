import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Provider/ColorProvider.dart';
import '../../di/di.dart';
import '../../domain/UseCases/AdminUseCases/GetAllDistrictsUseCase.dart';
import '../../domain/UseCases/AdminUseCases/getWorkersUseCase.dart';
import '../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';

class WorkersDropDown extends StatefulWidget {
  final Function(WorkerListObject?) onWorkerChanged;
  WorkersDropDown({required this.onWorkerChanged});

  @override
  State<WorkersDropDown> createState() => _WorkersDropDownState();
}

class _WorkersDropDownState extends State<WorkersDropDown> {
  WorkerListObject? workerChoosen;

  @override
  Widget build(BuildContext context) {
    getWorkersUseCase showWorkers = getIt<getWorkersUseCase>();
    var color = Provider.of<ColorProvider>(context);

    return FutureBuilder(
      future:showWorkers.invoke(),
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
        var workers = snapshot.data;
        print(workers);

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
                    hint: const Text("Select Worker",
                        style: TextStyle(
                            fontSize: 22, color: Colors.grey, fontFamily: "2")),
                    value: workerChoosen?.id,
                    onChanged: (newValue) {
                      setState(() {
                        workerChoosen = workers?.firstWhere(
                              (worker) => worker.id == newValue,
                          orElse: () => WorkerListObject(
                            id: "",
                          ),
                        );
                        widget.onWorkerChanged(workerChoosen);
                      });
                    },
                    items: workers?.map((worker) {
                      return DropdownMenuItem(
                        value: worker.id,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: color.isDarkEnabled() == true
                                            ? Colors.white
                                            : Colors.black))),
                            child: Text("${worker.firstName} ${worker.lastName}",
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
