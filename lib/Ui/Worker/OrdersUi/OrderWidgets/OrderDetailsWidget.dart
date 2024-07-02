import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../../../Common/LoadingLogo.dart';
import '../../../../Provider/Provider.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../di/di.dart';
import 'OrderDetailsViewModel.dart';
import 'OrderDetaislScreen.dart';

class OrderDetailsWidget extends StatefulWidget {



  static const String routeName = "OrderDetails";

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {

  var viewModel = getIt<OrderDetailsViewModel>();

  @override
  void initState() {
    super.initState();
    var orderID = ModalRoute.of(context)?.settings.arguments as String;
    viewModel.GetOrderDetails(orderID);


  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailsViewModel, OrderDetailsState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is OrderDetailsError) return false;
        if (current is OrderDetailsLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is OrderDetailsError) return true;
        if (current is OrderDetailsLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is OrderDetailsLoading) {
          // showLoading;
        }
        if (state is OrderDetailsError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is OrderDetailsSuccess) {
          return OrderDetailsScreen(details: state.order);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: LogoLoader(),
          ),
        );
      },);



  }
}
