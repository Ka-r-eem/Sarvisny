
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/snackBar.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/dialoguUtilites.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/RemoveFromCartUseCase.dart';
import '../../../di/di.dart';
import '../../../domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import 'MyCartViewModel.dart';

class CartRequestWidget extends StatefulWidget {
  final RequestedServices? service;
  bool deleted = false;

  CartRequestWidget(this.service);

  @override
  State<CartRequestWidget> createState() => _CartRequestWidgetState();
}

class _CartRequestWidgetState extends State<CartRequestWidget> {
  @override
  Widget build(BuildContext context) {
    // var viewModel = getIt<MyCartViewModel>();
    var provider = Provider.of<AppProvider>(context);

    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 3,
            ),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        "Worker: ${widget.service?.firstName}${widget.service?.lastName}",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Service: ${widget.service?.services?.first.serviceName ?? ""}",
                        style:  TextStyle(
                          fontSize: 18,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      Text(
                        "Day: ${widget.service?.dayOfWeek} | Date: ${widget.service?.requestedDate?.substring(0,10)}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Time: ${widget.service?.startTime?.substring(0, 5) ?? ""}",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        "Price: ${widget.service?.price} EGP",
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "2",
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),


                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: () async {
                  bool removed = await RemoveFromCartBtnFunction(context, provider.UserId, widget.service?.cartServiceRequestID ?? "");
                  if (removed) {
                    // print(widget.service?.serviceID);
                    setState(() {
                      widget.deleted = true;
                      // refresh(provider.UserId??"");

                      // provider.DecreaseCart();
                    });
                  }
                },
                icon: Icon(Icons.delete_rounded, color: Colors.red, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> RemoveFromCartBtnFunction(context, userId, String requestId) async {
    try {
      print("Request ID : $requestId");
      RemoveFromCartUseCase removeFromCartUseCase = getIt<RemoveFromCartUseCase>();
      var responseData = await removeFromCartUseCase.invoke(userId, requestId);
      if (responseData.isError == false) {
       // await refresh(userId);
        snackBar.showSnackBar(context, "Removed Successfully", Colors.green);
        return true;
      } else {
        dialoguUtilities.showmsg(
          context,
          responseData.message.toString(),
          pos: "Ok",
          postAction: () {
            print("Error message displayed");
          },
        );
        return false;
      }
    } catch (e) {
      print("Error occurred: $e");
      return false;
    }
  }
  // Future<void> refresh(String id)async {
  //   MyCartViewModel viewModel = getIt<MyCartViewModel>();
  //   viewModel.GetCartItems(id);
  // }
}


