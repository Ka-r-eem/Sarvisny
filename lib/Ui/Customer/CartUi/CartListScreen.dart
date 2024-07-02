import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Provider/Provider.dart';
import '../../../di/di.dart';
import '../../../domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import 'CartRequestsWidget.dart';
import 'MyCartViewModel.dart';

class CartListScreen extends StatefulWidget {
  static const String routeName = 'CartList';

  List<RequestedServices>? services;

  CartListScreen({Key? key, this.services}) : super(key: key);

  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: widget.services?.length == 0 ||  widget.services?.length == null? Center(child: Text("No Requests Found" ,style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),)) : ListView.builder(
              itemBuilder: (context, index) => CartRequestWidget(
                  widget.services?[index]),
              itemCount: widget.services?.length,
            ),
          ),
          MaterialButton(
              onPressed: () {
                  // OrderCartBtnFunction(context);
                  // provider.ResetCart();


              },
              color: Theme.of(context).colorScheme.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              height: 50,
              elevation: 10,
              child: const Text("Checkout",
                  style: TextStyle(color: Colors.white, fontSize: 25)))
        ],
      ),
    ));
  }

  // Future<void> OrderCartBtnFunction(context) async {
  //   try {
  //     dialoguUtilities.loadingDialog(context, "Please Wait..");
  //     var provider = Provider.of<AppProvider>(context, listen: false);
  //     var responseData = await viewModel.orderCartUseCase.invoke(provider.UserId);
  //     if (responseData.isError == false) {
  //       String? path = responseData.payload?.paymentUrl;
  //       final Uri url = Uri.parse(path??"");
  //       await _launchUrl(url);
  //       Navigator.pop(context);
  //
  //     } else {
  //       dialoguUtilities.showmsg(context, responseData.message.toString(),
  //           pos: "Ok", postAction: () async {
  //             Navigator.pop(context);
  //           });
  //     }
  //   } catch (e) {
  //     Navigator.pop(context);
  //     print("Error occurred: $e");
  //   }
  // }

}


Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
