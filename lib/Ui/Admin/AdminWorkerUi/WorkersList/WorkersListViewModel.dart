import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getWorkersUseCase.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersListResponse.dart';

@injectable
class WorkersListViewModel extends Cubit<WorkersListState>{

  getWorkersUseCase? ShowWorkersUseCase ;


  WorkersListViewModel(this.ShowWorkersUseCase):super(WorkerListLoading("Loading...")){}



  void GetWorkersList () async {
    emit(WorkerListLoading("Loading..."));

    try{
      var workersList =  await ShowWorkersUseCase!.invoke();
      emit(WorkerListSuccess(workersList));

    }
    catch(e){
      emit(WorkerListError(e.toString()));
      print("in the catch of worker list view model");
    }

  }



}

sealed class WorkersListState {}

class WorkerListSuccess extends WorkersListState{
  List<WorkerListObject>? WorkersList;
  WorkerListSuccess(this.WorkersList);
}
class WorkerListError extends WorkersListState{
  String? Message;
  WorkerListError(this.Message);
}
class WorkerListLoading extends WorkersListState{
  String? message ;
  WorkerListLoading (this.message);
}