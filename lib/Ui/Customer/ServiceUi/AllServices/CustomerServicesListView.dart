import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../di/di.dart';
import 'CustomerServicesListScreen.dart';
import 'ServicesViewModel.dart';

class CustomerServicesListWidget extends StatefulWidget {

  @override
  State<CustomerServicesListWidget> createState() => _CustomerServicesListWidgetState();
}

class _CustomerServicesListWidgetState extends State<CustomerServicesListWidget> {

  var viewModel = getIt<ServicesViewModel>();

  @override
  void initState() {
    // var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetServicesList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ServicesViewModel, ServicesListState>(
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
        if (state is ServicesListSuccess) {
          return CustomerServicesListScreen(ServicesList: state.services?.payload);
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


    //   FutureBuilder<CustomerServicesListResponseDto?>(
    //   future: ApiManager.GetServicesListForCustomer(),
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
    //     CustomerServicesListResponseDto? servicesList = snapshot.data;
    //     return CustomerServicesListScreen(ServicesList:servicesList?.payload);
    //   },
    // );
  }
}
