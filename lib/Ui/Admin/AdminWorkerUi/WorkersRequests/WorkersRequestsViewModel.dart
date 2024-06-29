import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/ShowAllRequestsUseCase.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkersRequestsResponse.dart';

@injectable
class WorkersRequestsViewModel extends Cubit<WorkersRequestsState>{

  ShowAllRequestsUseCase? ShowRequestsUseCase;

  WorkersRequestsViewModel(this.ShowRequestsUseCase):super(RequestsLoading("Loading...")) {}
  void GetRequests () async {
    emit(RequestsLoading("Loading..."));

    try{
      var response =  await ShowRequestsUseCase!.invoke();
      if(response == null ){
        emit(RequestsError("No Pending Requests"));
      }
      else if (response != null ){
        emit(RequestsSuccess(response));
      }
    }
    catch(e){
      emit(RequestsError(e.toString()));
      print("in the catch");
    }

  }


}

sealed class WorkersRequestsState {}

class RequestsSuccess extends WorkersRequestsState{
  List<WorkerRequest>? WorkersRequests;
  RequestsSuccess(this.WorkersRequests);
}
class RequestsError extends WorkersRequestsState{
  String? Message;
  RequestsError(this.Message);
}
class RequestsLoading extends WorkersRequestsState{
  String? message ;
  RequestsLoading (this.message);
}