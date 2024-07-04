import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/Seperator.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/OrderCartUseCase.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/PayTransactionUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/OrderCartResponse.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/PaymentTransactionResponse.dart';
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
  String? paymentMethod;

  @override
  Widget build(BuildContext context) {
    double total = 0.0;

    for (int i = 0; i < widget.services!.length; i++) {
      total += widget.services![i].price!;
    }
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: widget.services?.length == 0 ||
          widget.services?.length == null
          ? Center(
          child: Text(
            "No Requests Found",
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary),
          ))
          :Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Expanded(
                child: Column(
                  children: [
                    Text("Requested Services",style: TextStyle(fontFamily: '2',fontSize: 25,color: Theme.of(context).colorScheme.primary),),
                    Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) =>
                              CartRequestWidget(widget.services?[index]),
                          itemCount: widget.services?.length,
                        ),
                    ),
                  ],
                ),
              ),
          const Seperator(),
          Column(
            children: [
              Text(
                "Payment Summary",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25),
              ),
              Text(
                "Total : ${total.ceil()} EGP",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25),
              ),
            ],
          ),
          const Seperator(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pay With",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25),
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'Cash',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  const Text('Cash'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'PayPal',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  const Text('PayPal'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'PayMob',
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value;
                      });
                    },
                  ),
                  const Text('PayMob'),
                ],
              ),
            ],
          ),
          MaterialButton(
              onPressed: () {
                OrderCartBtnFunction(context);
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

Future<void> OrderCartBtnFunction(context) async {
  try {
    OrderCartUseCase orderCartUseCase = getIt<OrderCartUseCase>();
    PayTransactionUseCase payTransactionUseCase = getIt<PayTransactionUseCase>();
    dialoguUtilities.loadingDialog(context, "Please Wait..");
    var provider = Provider.of<AppProvider>(context, listen: false);
    OrderCartResponse responseData = await orderCartUseCase.invoke(provider.UserId, paymentMethod);
    if (responseData.isError == false){
      String? transID = responseData.payload?.transactiopnID;
      PaymentTransactionResponse paymentResponse = await payTransactionUseCase.invoke(transID);
      if(paymentResponse.isError == false){
        String? url = paymentResponse.payload?.paymentUrl;
        _launchUrl(Uri.parse(url!));
        Navigator.pop(context);
      }
    } else {
      dialoguUtilities.showmsg(context, responseData.status.toString(),
          pos: "Ok", postAction: () async {
            Navigator.pop(context);
          });
    }
  } catch (e) {
    Navigator.pop(context);
    print("Error occurred: $e");
  }
}
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
