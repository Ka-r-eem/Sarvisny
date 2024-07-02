import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';

import '../../../di/di.dart';
import 'ServiceListViewModel.dart';
import 'ServicesListScreen.dart';

class ServicesListWidget extends StatefulWidget {


  static const String routeName = "Service";

  @override
  State<ServicesListWidget> createState() => _ServicesListWidgetState();
}

class _ServicesListWidgetState extends State<ServicesListWidget> {
  ServiceListViewModel viewModel = getIt<ServiceListViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetServicesList();
  }
  Future<void> refresh()async {
    viewModel.GetServicesList();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: refresh,
      child: BlocConsumer<ServiceListViewModel, ServiceListState>(
        bloc: viewModel,
        buildWhen: (previous, current) {
          if (current is ServicesListError) return false;
          if (current is ServicesListLoading) return false;
          return true;
        },
        listenWhen: (previous, current) {
          if (current is ServicesListError) return true;
          if (current is ServicesListLoading) return true;
          return false;
        },
        listener: (context, state) {
          if (state is ServicesListLoading) {
            // showLoading;
          }
          if (state is ServicesListError) {
            // showMessage;
          }
        },
        builder: (context, state) {
          if (state is ServicesListSuccess ) {
            return ServicesListScreen(ServicesList: state.ServicesList, addServiceUseCase: viewModel.addServiceUseCase,addCriteriaUseCase: viewModel.addCriteriaUseCase,addServiceToCriteriaUseCase: viewModel.addServiceToCriteriaUseCase,);
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
      ),
    );

  }
}
