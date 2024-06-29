import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../Provider/Provider.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import 'WorkerServicesListScreen.dart';
import 'WorkerServicesListViewModel.dart';

class WorkerServicesListWidget extends StatefulWidget {

  @override
  State<WorkerServicesListWidget> createState() => _WorkerServicesListWidgetState();
}

class _WorkerServicesListWidgetState extends State<WorkerServicesListWidget> {


  var viewModel = getIt<WorkerServicesListViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetRegisteredServices(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerServicesListViewModel, WorkerServicesListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerServicesListError) return false;
        if (current is WorkerServicesListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerServicesListError) return true;
        if (current is WorkerServicesListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerServicesListLoading) {
          // showLoading;
        }
        if (state is WorkerServicesListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerServicesListSuccess) {
          return WorkerServicesListScreen(ServicesList: state.services);
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
