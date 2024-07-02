import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';

import '../../../di/di.dart';
import 'DistrictsListScreen.dart';
import 'DistrictsListViewModel.dart';

class DistrictsListWidget extends StatefulWidget {


  static const String routeName = "Service";

  @override
  State<DistrictsListWidget> createState() => _DistrictsListWidgetState();
}

class _DistrictsListWidgetState extends State<DistrictsListWidget> {
  DistrictsListViewModel viewModel = getIt<DistrictsListViewModel>();

  @override
  void initState(){
    super.initState();
    viewModel.GetDistrictsList();
  }
  Future<void> refresh()async {
    viewModel.GetDistrictsList();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: refresh,
      child: BlocConsumer<DistrictsListViewModel, DistrictsListState>(
        bloc: viewModel,
        buildWhen: (previous, current) {
          if (current is DistrictsListError) return false;
          if (current is DistrictsListLoading) return false;
          return true;
        },
        listenWhen: (previous, current) {
          if (current is DistrictsListError) return true;
          if (current is DistrictsListLoading) return true;
          return false;
        },
        listener: (context, state) {
          if (state is DistrictsListLoading) {
            // showLoading;
          }
          if (state is DistrictsListError) {
            // showMessage;
          }
        },
        builder: (context, state) {
          if (state is DistrictsListSuccess ) {
            return DistrictListScreen(DistrictsList: state.DistrictsList);
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
