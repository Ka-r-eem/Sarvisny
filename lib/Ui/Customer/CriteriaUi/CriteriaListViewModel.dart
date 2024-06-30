import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';
import '../../../domain/UseCases/AdminUseCases/GetParentsUseCase.dart';
import '../../../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart';


@injectable
class CriteriaListViewModel extends Cubit<CriteriaListState> {

  ShowAllCriteriasUseCase showAllCriteriasUseCase ;
  GetParentsUseCase getParentsUseCase ;


  CriteriaListViewModel(this.showAllCriteriasUseCase , this.getParentsUseCase) :super(CriteriaListLoading("Loading..."));


  void GetCriteria_Parents_List() async {
    emit(CriteriaListLoading("Loading..."));

    try {
      var Criterias = await showAllCriteriasUseCase.invoke();
      var parents = await getParentsUseCase.invoke();
      emit(CriteriaListSuccess(Criterias , parents));
    }
    catch (e) {
      emit(CriteriaListError(e.toString()));
      print("in the catch");
    }
  }}


sealed class CriteriaListState {}

class CriteriaListSuccess extends CriteriaListState {

  List<CriteriaObject>? criterias ;
  ParentsServicesResponse parents ;

  CriteriaListSuccess(this.criterias , this.parents);

}

class CriteriaListLoading extends CriteriaListState {
  String message;

  CriteriaListLoading(this.message);
}

class CriteriaListError extends CriteriaListState {
  String message;

  CriteriaListError(this.message);
}