import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetFilteredServicesUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetServiceWorkersResponse.dart';
import '../../../../domain/UseCases/CustomerUseCases/GetServiceWorkersUseCase.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';


@injectable
class FilteredWorkersViewModel extends Cubit<FilteredWorkersListState> {

  GetServiceWorkersUseCase getFilteredWorkersUSeCase ;

  FilteredWorkersViewModel(this.getFilteredWorkersUSeCase) :super(FilteredWorkersListLoading("Loading..."));


  void GetFilteredWorkersList(serviceID) async {
    emit(FilteredWorkersListLoading("Loading..."));

    try {
      var Workers = await getFilteredWorkersUSeCase.invoke(serviceID);
      emit(FilteredWorkersListSuccess(Workers));
    }
    catch (e) {
      emit(FilteredWorkersListError(e.toString()));
      print("in the catch");
    }
  }}


sealed class FilteredWorkersListState {}

class FilteredWorkersListSuccess extends FilteredWorkersListState {

  List<WorkerData>? workers ;


  FilteredWorkersListSuccess(this.workers);

}

class FilteredWorkersListLoading extends FilteredWorkersListState {
  String message;

  FilteredWorkersListLoading(this.message);
}

class FilteredWorkersListError extends FilteredWorkersListState {
  String message;

  FilteredWorkersListError(this.message);
}