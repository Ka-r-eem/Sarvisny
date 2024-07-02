import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../di/di.dart';
import 'OrderListScreen.dart';
import 'OrderListViewModel.dart';

class OrdersListWidget extends StatefulWidget {

  @override
  State<OrdersListWidget> createState() => _OrdersListWidgetState();
}

class _OrdersListWidgetState extends State<OrdersListWidget> {

  var viewModel = getIt<OrderListViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetOrders(provider.UserId??"");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    return BlocConsumer<OrderListViewModel, OrdersListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is OrdersListError) return false;
        if (current is OrdersListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is OrdersListError) return true;
        if (current is OrdersListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is OrdersListLoading) {
          // showLoading;
        }
        if (state is OrdersListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is OrdersListSuccess) {
          return CustomerOrderListScreen(state.orders);
        }
        else if (provider.token == null || provider.token == "") {
          return const Center(
            child: Text(
              "Please Login to See Your Orders :(",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: LogoLoader(),
          ),
        );
      },
    );



    //   FutureBuilder<CustomerOrdersLogResponseDto>(
    //   future: ApiManager.GetCustomerOrders(provider.UserId),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting || snapshot.data?.payload== null) {
    //       return const Center(child: LogoLoader());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     CustomerOrdersLogResponseDto? ordersList = snapshot.data;
    //     return CustomerOrderListScreen(ordersList?.payload);
    //   },
    // );
  }
}
