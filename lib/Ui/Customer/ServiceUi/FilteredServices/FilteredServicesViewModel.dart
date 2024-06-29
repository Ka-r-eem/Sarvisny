import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetFilteredServicesUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/FilteredServicesResponse.dart';
import '../../../../domain/UseCases/CustomerUseCases/GetServicesListUseCase.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';


@injectable
class FilteredServicesViewModel extends Cubit<FilteredServicesListState> {

  GetFilteredServicesUseCase getFilteredServicesUseCase ;

  FilteredServicesViewModel(this.getFilteredServicesUseCase) :super(FilteredServicesListLoading("Loading..."));


  void GetFilteredServicesList(criteriaId) async {
    emit(FilteredServicesListLoading("Loading..."));

    try {
      var Services = await getFilteredServicesUseCase.invoke(criteriaId);
      emit(FilteredServicesListSuccess(Services));
    }
    catch (e) {
      emit(FilteredServicesListError(e.toString()));
      print("in the catch of filtered services");
    }
  }}


sealed class FilteredServicesListState {}

class FilteredServicesListSuccess extends FilteredServicesListState {

  FilteredServicesResponse? services ;


  FilteredServicesListSuccess(this.services);

}

class FilteredServicesListLoading extends FilteredServicesListState {
  String message;

  FilteredServicesListLoading(this.message);
}

class FilteredServicesListError extends FilteredServicesListState {
  String message;

  FilteredServicesListError(this.message);
}