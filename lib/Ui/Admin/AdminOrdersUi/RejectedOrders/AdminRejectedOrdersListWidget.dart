import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../di/di.dart';
import '../AdminOrdersListScreen.dart';
import 'AdminRejectedOrdersViewModel.dart';

class AdminRejectedOrdersListWidget extends StatefulWidget {


  @override
  State<AdminRejectedOrdersListWidget> createState() => _AdminRejectedOrdersListWidgetState();
}

class _AdminRejectedOrdersListWidgetState extends State<AdminRejectedOrdersListWidget> {
  AdminRejectedOrdersViewModel viewModel = getIt<AdminRejectedOrdersViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetRejectedOrdersList();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminRejectedOrdersViewModel, RejectedOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is RejectedOrdersListError) return false;
        if (current is RejectedOrdersListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is RejectedOrdersListError) return true;
        if (current is RejectedOrdersListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is RejectedOrdersListLoading) {
          // showLoading;
        }
        if (state is RejectedOrdersListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is RejectedOrdersListSuccess ) {
          return AdminOrdersListScreen(ordersList: state.OrdersList);
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
