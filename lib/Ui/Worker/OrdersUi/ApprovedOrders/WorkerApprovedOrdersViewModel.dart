import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/AllOrdersUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/ApprovedOrdersUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';

import '../../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';


@injectable
class WorkerApprovedOrdersViewModel extends Cubit<WorkerApprovedOrdersState> {

  ApprovedOrdersUseCase approvedOrdersUseCase ;


  WorkerApprovedOrdersViewModel(this.approvedOrdersUseCase) :super(WorkerApprovedOrdersLoading("Loading..."));


  void GetApprovedOrders(String workerID) async {
    emit(WorkerApprovedOrdersLoading("Loading..."));

    try {
      WorkerOrdersListResponse orders = await approvedOrdersUseCase.invoke(workerID);
      emit(WorkerApprovedOrdersSuccess(orders.payload));
    }
    catch (e) {
      emit(WorkerApprovedOrdersError(e.toString()));
      print("in the catch");
    }
  }}


sealed class WorkerApprovedOrdersState {}

class WorkerApprovedOrdersSuccess extends WorkerApprovedOrdersState {

 List<OutSidePayload>? orders;

  WorkerApprovedOrdersSuccess(this.orders);

}

class WorkerApprovedOrdersLoading extends WorkerApprovedOrdersState {
  String message;

  WorkerApprovedOrdersLoading(this.message);
}

class WorkerApprovedOrdersError extends WorkerApprovedOrdersState {
  String message;

  WorkerApprovedOrdersError(this.message);
}