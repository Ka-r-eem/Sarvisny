import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import '../../../domain/UseCases/AdminUseCases/ShowAllCriteriasUseCase.dart';


@injectable
class CriteriaListViewModel extends Cubit<CriteriaListState> {

  ShowAllCriteriasUseCase showAllCriteriasUseCase ;


  CriteriaListViewModel(this.showAllCriteriasUseCase) :super(CriteriaListLoading("Loading..."));


  void GetCriteriaList() async {
    emit(CriteriaListLoading("Loading..."));

    try {
      var Criterias = await showAllCriteriasUseCase.invoke();
      emit(CriteriaListSuccess(Criterias));
    }
    catch (e) {
      emit(CriteriaListError(e.toString()));
      print("in the catch");
    }
  }}


sealed class CriteriaListState {}

class CriteriaListSuccess extends CriteriaListState {

  List<CriteriaObject>? criterias ;

  CriteriaListSuccess(this.criterias);

}

class CriteriaListLoading extends CriteriaListState {
  String message;

  CriteriaListLoading(this.message);
}

class CriteriaListError extends CriteriaListState {
  String message;

  CriteriaListError(this.message);
}