import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../di/di.dart';
import '../AdminOrdersListScreen.dart';
import 'AdminPendingOrdersViewModel.dart';

class AdminPendingOrdersListWidget extends StatefulWidget {

  @override
  State<AdminPendingOrdersListWidget> createState() => _AdminPendingOrdersListWidgetState();
}

class _AdminPendingOrdersListWidgetState extends State<AdminPendingOrdersListWidget> {
  AdminPendingOrdersViewModel viewModel = getIt<AdminPendingOrdersViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetOrdersList();
  }


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AdminPendingOrdersViewModel, PendingOrdersState >(
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
}}
