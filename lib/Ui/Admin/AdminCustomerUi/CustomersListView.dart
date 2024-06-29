import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Common/LoadingLogo.dart';
import '../../../di/di.dart';
import 'CustomerListViewModel.dart';
import 'CustomersListScreen.dart';

class CustomerListView extends StatefulWidget {
  const CustomerListView({super.key});

  @override
  State<CustomerListView> createState() => _CustomerListViewState();
}



class _CustomerListViewState extends State<CustomerListView> {

  var viewModel = getIt<CustomerListViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.GetCustomersList();
  }

  Future<void> refresh()async {
    viewModel.GetCustomersList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: BlocBuilder<CustomerListViewModel , CustomerListState>(
        bloc: viewModel,
        builder: (context, state) {
          switch (state) {
        case CustomerListSuccess():
          return CustomersListScreen(CustomersList: state.CustomersList,);
        case CustomerListError():
          return Center(
            child: Column(
              children: [
                Text(state.message ?? ""),
                ElevatedButton(
                    onPressed: () {
                      refresh();
                    },
                    child: const Text('Try Again'))
              ],
            ),
          );
        case CustomerListLoading():
          return const Center(child: LogoLoader());
      }
        },
        ),
    );
  }
}
