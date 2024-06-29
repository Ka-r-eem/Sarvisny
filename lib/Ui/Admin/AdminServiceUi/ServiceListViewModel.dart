import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/UseCases/AdminUseCases/AddCriteriaUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/AddServiceToCriteriaUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/AddServiceUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/ShowServicesUseCase.dart';
import '../../../domain/model/AdminRelatedResponses/ServicesListResponse.dart';

@injectable
class ServiceListViewModel extends Cubit<ServiceListState> {


  ShowServicesUseCase? showServicesuseCase ;
  ShowAllCriteriasUseCase showAllCriteriasUseCase ;
  AddServiceToCriteriaUseCase addServiceToCriteriaUseCase ;
  AddCriteriaUseCase addCriteriaUseCase ;
  AddServiceUseCase addServiceUseCase ;

  @factoryMethod ServiceListViewModel(this.showServicesuseCase ,this.addServiceUseCase, this.addCriteriaUseCase,this.addServiceToCriteriaUseCase,this.showAllCriteriasUseCase) :super(ServicesListLoading("Loading..."));


  void GetServicesList() async {
  emit(ServicesListLoading("Loading..."));

  try {
    var services = await showServicesuseCase!.invoke();
    emit(ServicesListSuccess(services));
  }
  catch (e) {
    emit(ServicesListError(e.toString()));
    print("in the catch");
  }
}}


sealed class ServiceListState {}

class ServicesListSuccess extends ServiceListState {

 List<ServiceObject>? ServicesList;

  ServicesListSuccess(this.ServicesList);

}

class ServicesListLoading extends ServiceListState {
  String message;

  ServicesListLoading(this.message);
}

class ServicesListError extends ServiceListState {
  String message;

  ServicesListError(this.message);
}