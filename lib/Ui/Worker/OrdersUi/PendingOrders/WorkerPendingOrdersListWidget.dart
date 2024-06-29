import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../Provider/Provider.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../di/di.dart';
import '../WorkerOrdersListScreen.dart';
import 'WorkerPendingOrdersViewModel.dart';

class WorkerPendingOrdersListWidget extends StatefulWidget {

  @override
  State<WorkerPendingOrdersListWidget> createState() => _WorkerPendingOrdersListWidgetState();
}

class _WorkerPendingOrdersListWidgetState extends State<WorkerPendingOrdersListWidget> {

  var viewModel = getIt<WorkerPendingOrdersViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetApprovedOrders(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerPendingOrdersViewModel, WorkerPendingOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerPendingOrdersError) return false;
        if (current is WorkerPendingOrdersLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerPendingOrdersError) return true;
        if (current is WorkerPendingOrdersLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerPendingOrdersLoading) {
          // showLoading;
        }
        if (state is WorkerPendingOrdersError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerPendingOrdersSuccess) {
          return WorkerOrdersListScreen(ordersList: state.orders);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },);



  }
}
