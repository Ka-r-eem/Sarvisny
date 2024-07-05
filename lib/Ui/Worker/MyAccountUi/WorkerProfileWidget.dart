import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Worker/MyAccountUi/WorkerProfile.dart';

import '../../../Common/LoadingLogo.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import 'WorkerProfileViewModel.dart';

class WorkerProfileWidget extends StatefulWidget
{
  const WorkerProfileWidget({super.key});

  @override
  State<WorkerProfileWidget> createState() => _WorkerProfileWidgetState();
}

class _WorkerProfileWidgetState extends State<WorkerProfileWidget> {

  var viewModel = getIt<WorkerProfileViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetProfile(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerProfileViewModel, WorkerProfileState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is WorkerProfileError) return false;
        if (current is WorkerProfileLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is WorkerProfileError) return true;
        if (current is WorkerProfileLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is WorkerProfileLoading) {
          // showLoading;
        }
        if (state is WorkerProfileError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is WorkerProfileSuccess) {
          return WorkerProfilePage(details: state.profile ,base64Image: state.base64Image);
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
}}
