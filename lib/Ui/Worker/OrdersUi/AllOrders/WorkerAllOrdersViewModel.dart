import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/AllOrdersUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';

import '../../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';


@injectable
class WorkerAllOrdersViewModel extends Cubit<WorkerAllOrdersState> {

  AllOrdersUseCase allOrdersUseCase ;


  WorkerAllOrdersViewModel(this.allOrdersUseCase) :super(WorkerAllOrdersLoading("Loading..."));


  void GetAllOrders(String workerID) async {
    emit(WorkerAllOrdersLoading("Loading..."));

    try {
      WorkerOrdersListResponse orders = await allOrdersUseCase.invoke(workerID);
      emit(WorkerAllOrdersSuccess(orders.payload));
    }
    catch (e) {
      emit(WorkerAllOrdersError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class WorkerAllOrdersState {}

class WorkerAllOrdersSuccess extends WorkerAllOrdersState {

 List<OutSidePayload>? orders;

  WorkerAllOrdersSuccess(this.orders);

}

class WorkerAllOrdersLoading extends WorkerAllOrdersState {
  String message;

  WorkerAllOrdersLoading(this.message);
}

class WorkerAllOrdersError extends WorkerAllOrdersState {
  String message;

  WorkerAllOrdersError(this.message);
}