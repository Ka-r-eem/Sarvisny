// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../../Provider/ColorProvider.dart';
// import '../../../data/API/apiManager.dart';
// import '../../../di/di.dart';
// import '../../../domain/UseCases/AdminUseCases/ShowServicesUseCase.dart';
// import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';
//
// class ServiceDropDown extends StatefulWidget {
//   final Function(ServiceObject?) onServiceChanged;
//
//   ServiceDropDown({required this.onServiceChanged});
//
//   @override
//   State<ServiceDropDown> createState() => _ServiceDropDownState();
// }
//
// class _ServiceDropDownState extends State<ServiceDropDown> {
//   ServiceObject? serviceChoosen;
//
//   @override
//   Widget build(BuildContext context) {
//
//     ShowServicesUseCase showServicesUseCase = getIt<ShowServicesUseCase>();
//
// var color = Provider.of<ColorProvider>(context);
//
//      return FutureBuilder(
//       future: showServicesUseCase.invoke(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Column(
//               children: [
//                 Text(snapshot.error.toString()),
//                 ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
//               ],
//             ),
//           );
//         }
//         var servicesList = snapshot.data;
//
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
//           child: Container(
//             height: 65,
//             decoration: BoxDecoration(
//                 border: Border.all(color: const Color(0xff3a8bc8)),
//                 borderRadius: BorderRadius.circular(10)),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   DropdownButton(
//                     dropdownColor: Theme.of(context).colorScheme.onSecondary,
//                     isExpanded: true,
//                     alignment: Alignment.center,
//                     style: const TextStyle(
//                         fontSize: 18,
//                         fontFamily: "2",
//                         color: Colors.grey ),
//                     hint: const Text("Select Service", style: TextStyle(
//                         fontSize: 22,
//                         color: Colors.grey,
//                         fontFamily: "2")),
//                     value: serviceChoosen?.serviceID,
//                     onChanged: (newValue) {
//                       setState(() {
//                         serviceChoosen = servicesList?.firstWhere(
//                               (service) => service.serviceID == newValue,
//                         );
//                         widget.onServiceChanged(serviceChoosen);
//
//                       });
//                     },
//                     items: servicesList?.map((service) {
//                       return DropdownMenuItem(
//                         value: service.serviceID,
//                         child: Container(
//                           width: double.infinity,
//                             decoration: BoxDecoration(border:Border(bottom: BorderSide(color: color.isDarkEnabled() == true ? Colors.white : Colors.black))),
//                             child: Text("${service.serviceName}", style: TextStyle(color: color.isDarkEnabled() == true ? Colors.white : Colors.black))),
//                       );
//                     }).toList(),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
