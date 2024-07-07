import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../../Provider/Provider.dart';
import '../../../../di/di.dart';
import '../WorkerOrdersListScreen.dart';
import 'WorkerAllOrdersViewModel.dart';

class WorkerAllOrdersListWidget extends StatefulWidget {

  @override
  State<WorkerAllOrdersListWidget> createState() => _WorkerAllOrdersListWidgetState();
}

class _WorkerAllOrdersListWidgetState extends State<WorkerAllOrdersListWidget> {

  var viewModel = getIt<WorkerAllOrdersViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetAllOrders(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerAllOrdersViewModel, WorkerAllOrdersState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerAllOrdersError) return false;
        if (current is WorkerAllOrdersLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerAllOrdersError) return true;
        if (current is WorkerAllOrdersLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerAllOrdersLoading) {
          // showLoading;
        }
        if (state is WorkerAllOrdersError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerAllOrdersSuccess) {
          print(state.orders?.first.payload);
          return WorkerOrdersListScreen(ordersList: state.orders);
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
