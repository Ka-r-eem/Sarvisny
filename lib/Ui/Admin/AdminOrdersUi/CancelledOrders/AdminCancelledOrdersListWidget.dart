import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';
import '../AdminOrdersListScreen.dart';
import 'AdminCancelledOrdersViewModel.dart';

class AdminCancelledOrdersListWidget extends StatefulWidget {


  @override
  State<AdminCancelledOrdersListWidget> createState() => _AdminCancelledOrdersListWidgetState();
}

class _AdminCancelledOrdersListWidgetState extends State<AdminCancelledOrdersListWidget> {
  AdminCancelledOrdersViewModel viewModel = getIt<AdminCancelledOrdersViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetCancelledOrdersList();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminCancelledOrdersViewModel, CancelledOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CancelledOrdersListError) return false;
        if (current is CancelledOrdersListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CancelledOrdersListError) return true;
        if (current is CancelledOrdersListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is CancelledOrdersListLoading) {
          // showLoading;
        }
        if (state is CancelledOrdersListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is CancelledOrdersListSuccess ) {
          return AdminOrdersListScreen(ordersList: state.OrdersList);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );



    //   FutureBuilder<OrdersResponseDto>(
    //   future: ApiManager.GetAllOrdersForAdmin(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting ) {
    //       print(snapshot.connectionState);
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
    //     var ordersList = snapshot.data?.payload?.map((dto) => dto.toOrder()).toList();
    //     return AdminOrdersListScreen(ordersList:ordersList);
    //   },
    // );
  }
}
