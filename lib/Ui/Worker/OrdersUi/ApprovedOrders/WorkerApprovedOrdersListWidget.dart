import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../Provider/Provider.dart';
import '../../../../data/API/apiManager.dart';
import '../../../../di/di.dart';
import '../WorkerOrdersListScreen.dart';
import 'WorkerApprovedOrdersViewModel.dart';

class WorkerApprovedOrdersListWidget extends StatefulWidget {

  @override
  State<WorkerApprovedOrdersListWidget> createState() => _WorkerApprovedOrdersListWidgetState();
}

class _WorkerApprovedOrdersListWidgetState extends State<WorkerApprovedOrdersListWidget> {

  var viewModel = getIt<WorkerApprovedOrdersViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetApprovedOrders(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerApprovedOrdersViewModel, WorkerApprovedOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerApprovedOrdersError) return false;
        if (current is WorkerApprovedOrdersLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerApprovedOrdersError) return true;
        if (current is WorkerApprovedOrdersLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerApprovedOrdersLoading) {
          // showLoading;
        }
        if (state is WorkerApprovedOrdersError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerApprovedOrdersSuccess) {
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
