import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/PendingOrdersUseCase.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';

@injectable
class WorkerPendingOrdersViewModel extends Cubit<WorkerPendingOrdersState> {

  PendingOrdersUseCase pendingOrdersUseCase ;


  WorkerPendingOrdersViewModel(this.pendingOrdersUseCase) :super(WorkerPendingOrdersLoading("Loading..."));


  void GetApprovedOrders(String workerID) async {
    emit(WorkerPendingOrdersLoading("Loading..."));

    try {
      WorkerOrdersListResponse orders = await pendingOrdersUseCase.invoke(workerID);
      emit(WorkerPendingOrdersSuccess(orders.payload));
    }
    catch (e) {
      emit(WorkerPendingOrdersError(e.toString()));
      print("in the catch");
    }
  }}


sealed class WorkerPendingOrdersState {}

class WorkerPendingOrdersSuccess extends WorkerPendingOrdersState {

 List<OutSidePayload>? orders;

  WorkerPendingOrdersSuccess(this.orders);

}

class WorkerPendingOrdersLoading extends WorkerPendingOrdersState {
  String message;

  WorkerPendingOrdersLoading(this.message);
}

class WorkerPendingOrdersError extends WorkerPendingOrdersState {
  String message;

  WorkerPendingOrdersError(this.message);
}