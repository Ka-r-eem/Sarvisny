import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sarvisny/Provider/Provider.dart';
import '../../../../di/di.dart';
import '../../../../domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../AllServices/ServicesViewModel.dart';
import 'FilteredCustomerServicesListScreen.dart';
import 'FilteredServicesViewModel.dart';

class FilteredCustomerServicesListWidget extends StatefulWidget {
  static const String routeName = 'FilteredServices';

  @override
  State<FilteredCustomerServicesListWidget> createState() => _FilteredCustomerServicesListWidgetState();
}

class _FilteredCustomerServicesListWidgetState extends State<FilteredCustomerServicesListWidget> {
  var viewModel = getIt<FilteredServicesViewModel>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _fetchFilteredServices();
  }

  void _fetchFilteredServices() {
    var criteria = ModalRoute.of(context)?.settings.arguments as CriteriaObject;
    viewModel.GetFilteredServicesList(criteria.criteriaID);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FilteredServicesViewModel, FilteredServicesListState>(
      bloc: viewModel,
      buildWhen: (previous, current) {
        if (current is FilteredServicesListError) return false;
        if (current is ServicesListLoading) return false;
        return true;
      },
      listenWhen: (previous, current) {
        if (current is FilteredServicesListError) return true;
        if (current is FilteredServicesListLoading) return true;
        return false;
      },
      listener: (context, state) {
        if (state is FilteredServicesListLoading) {
          // showLoading;
        }
        if (state is FilteredServicesListError) {
          // showMessage;
        }
      },
      builder: (context, state) {
        if (state is FilteredServicesListSuccess) {
          return FilteredCustomerServicesListScreen(
              FilteredServicesList: state.services?.payload?.services);
        }
        return Scaffold(
          appBar: AppBar(
            title: Text("Default Screen"),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
