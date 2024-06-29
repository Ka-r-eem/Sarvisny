import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Common/LoadingLogo.dart';
import '../../../../di/di.dart';
import 'WorkersRequestsListScreen.dart';
import 'WorkersRequestsViewModel.dart';

class WorkersRequestListView extends StatefulWidget {
  @override
  State<WorkersRequestListView> createState() => _WorkersRequestListViewState();
}

class _WorkersRequestListViewState extends State<WorkersRequestListView> {
  var viewModel = getIt<WorkersRequestsViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.GetRequests();
  }

  Future<void> _refresh() async {
    viewModel.GetRequests();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: BlocBuilder<WorkersRequestsViewModel, WorkersRequestsState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case RequestsSuccess():
              return WorkersRequestsListScreen(
                  Requests: state.WorkersRequests);
            case RequestsError():
              return Center(
                child: Column(
                  children: [
                    Text(state.Message.toString()),
                    ElevatedButton(
                        onPressed: _refresh, child: const Center(child: Text('Try Again')))
                  ],
                ),
              );
            case RequestsLoading():
              return const Center(child: LogoLoader());
            default:
              return const LogoLoader();
          }
        },
      ),
    );
  }
}
