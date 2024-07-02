import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Common/LoadingLogo.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../../di/di.dart';
import '../../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';
import '../AllServices/ServicesViewModel.dart';
import 'ChildrenServicesListScreen.dart';
import 'ChildrenViewModel.dart';

class ChildrenServicesListWidget extends StatefulWidget {
  static const String routeName = 'ChildrenServices';

  @override
  State<ChildrenServicesListWidget> createState() =>
      _ChildrenServicesListWidgetState();
}

class _ChildrenServicesListWidgetState
    extends State<ChildrenServicesListWidget> {
  var viewModel = getIt<ChildrenServicesViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchChildrenServices();
  }

  void _fetchChildrenServices() {
    var service = ModalRoute.of(context)?.settings.arguments as CustomerServiceItem;
    print(" Inside viewModel service id ${service.serviceID}");
    viewModel.GetChildrenServicesList(service.serviceID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChildrenServicesViewModel, ChildrenServicesListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is ChildrenServicesListError) return false;
        if (current is ServicesListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is ChildrenServicesListError) return true;
        if (current is ChildrenServicesListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is ChildrenServicesListLoading) {
          // showLoading;
        }
        if (state is ChildrenServicesListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is ChildrenServicesListSuccess) {
          print("Before Success");
          print(state.children?.first);
          return ChildrenServicesListScreen(children: state.children);
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
