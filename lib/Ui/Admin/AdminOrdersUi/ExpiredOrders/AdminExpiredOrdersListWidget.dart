import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';
import '../AdminOrdersListScreen.dart';
import 'AdminExpiredOrdersViewModel.dart';

class AdminExpiredOrdersListWidget extends StatefulWidget {


  @override
  State<AdminExpiredOrdersListWidget> createState() => _AdminExpiredOrdersListWidgetState();
}

class _AdminExpiredOrdersListWidgetState extends State<AdminExpiredOrdersListWidget> {
  AdminExpiredOrdersViewModel viewModel = getIt<AdminExpiredOrdersViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetExpiredOrdersList();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminExpiredOrdersViewModel, ExpiredOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is ExpiredOrdersListError) return false;
        if (current is ExpiredOrdersListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is ExpiredOrdersListError) return true;
        if (current is ExpiredOrdersListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is ExpiredOrdersListLoading) {
          // showLoading;
        }
        if (state is ExpiredOrdersListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is ExpiredOrdersListSuccess ) {
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
