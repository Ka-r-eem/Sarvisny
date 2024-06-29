import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Common/LoadingLogo.dart';
import '../../../../di/di.dart';
import 'WorkersListScreen.dart';
import 'WorkersListViewModel.dart';

class WorkersListView extends StatefulWidget {
  @override
  State<WorkersListView> createState() => _WorkersListViewState();
}

class _WorkersListViewState extends State<WorkersListView> {

  var viewModel = getIt<WorkersListViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.GetWorkersList();
  }

  Future<void>_refresh ()async{
    viewModel.GetWorkersList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: BlocBuilder<WorkersListViewModel, WorkersListState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
            case WorkerListSuccess():
              return WorkersListScreen(WorkersList: state.WorkersList);
            case WorkerListError():
              return const Center(
                child: Center(child: Text("No Workers Registered" ,style: TextStyle(fontSize: 25),)),
              );
            case WorkerListLoading():
              return const Center(child: LogoLoader());
          }
        },
      ),
    );
  //   Widget build(BuildContext context) {
  //     return RefreshIndicator(
  //       onRefresh: refresh,
  //       child: BlocBuilder<CustomerListViewModel , CustomerListState>(
  //         bloc: viewModel,
  //         builder: (context, state) {
  //           switch (state) {
  //             case CustomerListSuccess():
  //               return CustomersListScreen(CustomersList: state.CustomersList,);
  //             case CustomerListError():
  //               return Center(
  //                 child: Column(
  //                   children: [
  //                     Text(state.message ?? ""),
  //                     ElevatedButton(
  //                         onPressed: () {
  //                           refresh();
  //                         },
  //                         child: const Text('Try Again'))
  //                   ],
  //                 ),
  //               );
  //             case CustomerListLoading():
  //               return const Center(child: LogoLoader());
  //           }
  //         },
  //       ),
  //     );
  // }
}}
