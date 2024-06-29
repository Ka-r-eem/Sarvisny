import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../../di/di.dart';
import 'SlotsListScreen.dart';
import 'SlotsListViewModel.dart';

class SlotsListWidget extends StatefulWidget {

  static const String routeName = "SlotList";

  @override
  State<SlotsListWidget> createState() => _SlotsListWidgetState();
}

class _SlotsListWidgetState extends State<SlotsListWidget> {

  var viewModel = getIt<SlotsListViewModel>();

  @override
  void initState() {
    var provider = Provider.of<AppProvider>(context, listen: false);
    viewModel.GetSlots(provider.UserId??"");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SlotsListViewModel, SlotsListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is SlotsListError) return false;
        if (current is SlotsListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is SlotsListError) return true;
        if (current is SlotsListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is SlotsListLoading) {
          // showLoading;
        }
        if (state is SlotsListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is SlotsListSuccess) {
          return SlotsListScreen(SlotsList: state.slots,);
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

  // @override
  // Widget build(BuildContext context) {
  //
  //   var provider = Provider.of<AppProvider>(context);
  //
  //   return FutureBuilder<WorkerSlotsResponseDataDto?>(
  //     future: ApiManager.GetWorkerSlots(provider.UserId),
  //     builder: (context, snapshot) {
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return const Center(child: LogoLoader());
  //       } else if (snapshot.data?.isError == true) {
  //         return Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text("No Slots Registered"),
  //               ElevatedButton(onPressed: () {}, child: const Text('Try Again'))
  //             ],
  //           ),
  //         );
  //       }
  //       WorkerSlotsResponseDataDto? slotsList = snapshot.data;
  //       return SlotsListScreen( SlotsList:slotsList?.payload);
  //     },
  //   );
  // }
}}
