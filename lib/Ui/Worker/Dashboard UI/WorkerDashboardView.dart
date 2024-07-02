import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';

import '../../../Common/LoadingLogo.dart';
import '../../../data/API/apiManager.dart';
import '../../../data/Responses/WorkerRelatedDto/ServiceProviderProfileData.dart';
import '../../../di/di.dart';
import 'WorkerDashboardScreen.dart';
import 'WorkerDashboardViewModel.dart';

class WorkerDashboardView extends StatefulWidget {
  const WorkerDashboardView({super.key});

  @override
  State<WorkerDashboardView> createState() => _WorkerDashboardViewState();
}

class _WorkerDashboardViewState extends State<WorkerDashboardView> {
  var viewModel = getIt<WorkerDashboardViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetDashboard(provider.UserId??"");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerDashboardViewModel, WorkerDashboardState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerDashboardError) return false;
        if (current is WorkerDashboardLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerDashboardError) return true;
        if (current is WorkerDashboardLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerDashboardLoading) {
          // showLoading;
        }
        if (state is WorkerDashboardError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerDashboardSuccess) {
          return WorkerDashboardScreen(
            details: state.profile,
            requests: state.orders,
          );
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
  }
}
