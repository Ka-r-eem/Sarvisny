import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../di/di.dart';
import '../AdminOrdersListScreen.dart';
import 'AdminAllOrdersViewModel.dart';

class AdminAllOrdersListWidget extends StatefulWidget {


  @override
  State<AdminAllOrdersListWidget> createState() => _AdminAllOrdersListWidgetState();
}

class _AdminAllOrdersListWidgetState extends State<AdminAllOrdersListWidget> {
  AdminAllOrdersViewModel viewModel = getIt<AdminAllOrdersViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetOrdersList();
  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminAllOrdersViewModel, AllOrdersState>(
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
        if (state is OrdersListSuccess ) {
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
