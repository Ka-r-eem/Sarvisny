import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import '../../../data/API/apiManager.dart';
import '../../../di/di.dart';
import 'CriteriaListViewModel.dart';
import 'CustomerCriteriaListScreen.dart';

class CustomerCriteriaListView extends StatefulWidget {

  @override
  State<CustomerCriteriaListView> createState() => _CustomerCriteriaListViewState();
}

class _CustomerCriteriaListViewState extends State<CustomerCriteriaListView> {


  var viewModel = getIt<CriteriaListViewModel>();

  @override
  void initState() {
    // var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetCriteriaList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CriteriaListViewModel, CriteriaListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is CriteriaListError) return false;
        if (current is CriteriaListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is CriteriaListError) return true;
        if (current is CriteriaListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is CriteriaListLoading) {
          // showLoading;
        }
        if (state is CriteriaListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is CriteriaListSuccess) {
          return CustomerCriteriaListScreen(CriteriasList: state.criterias);
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

    // ));
    //
    //
    //   FutureBuilder<CriteriaListResponseDto?>(
    //   future: ApiManager.GetCriteriasList(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting ) {
    //       print(snapshot.connectionState);
    //       return const Center(child: LogoLoader());
    //     } else if (snapshot.hasError) {
    //       return Center(
    //         child: Column(
    //           children: [
    //             Text(snapshot.error.toString()),
    //             ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
    //           ],
    //         ),
    //       );
    //     }
    //     CriteriaListResponseDto? criteriasList = snapshot.data;
    //     return CustomerCriteriaListScreen(CriteriasList:criteriasList?.payload);
    //   },
    // );
  }
}
