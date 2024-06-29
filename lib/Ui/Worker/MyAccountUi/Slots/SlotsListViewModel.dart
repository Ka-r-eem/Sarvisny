import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';

import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';


@injectable
class SlotsListViewModel extends Cubit<SlotsListState> {

  WorkerSlotsUseCase workerSlotsUseCase ;


  SlotsListViewModel(this.workerSlotsUseCase) :super(SlotsListLoading("Loading..."));


  void GetSlots(String workerID) async {
    emit(SlotsListLoading("Loading..."));

    try {
      WorkerSlotsResponseData Slots = await workerSlotsUseCase.invoke(workerID);
      emit(SlotsListSuccess(Slots.payload));
    }
    catch (e) {
      emit(SlotsListError(e.toString()));
      print("in the catch");
    }
  }}


sealed class SlotsListState {}

class SlotsListSuccess extends SlotsListState {

  List<WorkerSlots>? slots ;

  SlotsListSuccess(this.slots);

}

class SlotsListLoading extends SlotsListState {
  String message;

  SlotsListLoading(this.message);
}

class SlotsListError extends SlotsListState {
  String message;

  SlotsListError(this.message);
}