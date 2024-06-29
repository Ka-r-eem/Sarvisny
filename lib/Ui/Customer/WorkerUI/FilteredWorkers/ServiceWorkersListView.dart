import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import 'package:sarvisny/Ui/Customer/WorkerUI/FilteredWorkers/FilteredWorkersViewModel.dart';
import '../../../../di/di.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import 'ServiceWorkersListScreen.dart';

class ServiceWorkersListView extends StatefulWidget {

  static const String routeName = 'ServiceWorkersList';

  @override
  State<ServiceWorkersListView> createState() => _ServiceWorkersListViewState();
}

class _ServiceWorkersListViewState extends State<ServiceWorkersListView> {

  var viewModel = getIt<FilteredWorkersViewModel>();

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchFilteredWorkers();
  }

  void _fetchFilteredWorkers() {
  var service = ModalRoute.of(context)?.settings.arguments as CustomerServiceItem;
    viewModel.GetFilteredWorkersList(service.serviceID);
  }

  @override
  Widget build(BuildContext context) {
    var service = ModalRoute.of(context)?.settings.arguments as CustomerServiceItem;
    return BlocConsumer<FilteredWorkersViewModel, FilteredWorkersListState>(
        bloc: viewModel,
        buildWhen: (previous, current) {
          if (current is FilteredWorkersListError) return false;
          if (current is FilteredWorkersListLoading) return false;
          return true;
        },
        listenWhen: (previous, current) {
          if (current is FilteredWorkersListError) return true;
          if (current is FilteredWorkersListLoading) return true;
          return false;
        },
        listener: (context, state) {
          if (state is FilteredWorkersListLoading) {
            // showLoading;
          }
          if (state is FilteredWorkersListError) {
            // showMessage;
          }
        },
        builder: (context, state) {
          if (state is FilteredWorkersListSuccess) {
             return ServiceWorkersListScreen(workersList: state.workers , serviceItem: service);          }
          return Scaffold(
            appBar: AppBar(
              title: Text("Default Screen"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },);






















    //   FutureBuilder<GetServiceWorkersResponseDto?>(
    //   future: ApiManager.GetServiceWorkers(service.serviceID),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting ) {
    //       print(snapshot.connectionState);
    //       print("in Service Worker List Widget");
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
    //     GetServiceWorkersResponseDto? workersList = snapshot.data;
    //     print(workersList?.message.toString());
    //     return ServiceWorkersListScreen(workersList:workersList?.payload ,serviceItem: service,);
    //   },
    // );
  }
}
