// import 'package:flutter/material.dart';
// import '../../../../Common/LoadingLogo.dart';
// import '../../../../data/API/apiManager.dart';
// import '../../../../data/Responses/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';
// import 'OrderDetailsScreen.dart';
//
// class AdminOrderDetailsWidget extends StatelessWidget {
//
//
//
//   static const String routeName = "AdminOrderDetails";
//
//   @override
//   Widget build(BuildContext context) {
//     var orderID = ModalRoute.of(context)?.settings.arguments as String?;
//
//     return FutureBuilder<ShowOrderDetailsResponseDto?>(
//       future: ApiManager.GetOrderDetails(orderID),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting ) {
//           return const Center(child: LogoLoader());
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
//         ShowOrderDetailsResponseDto? orderDetails = snapshot.data;
//         return OrderDetailsScreen(orderDetails?.payload);
//       },
//     );
//
//
//
//
//
//     ;
//   }
// }
