import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/PendingOrdersUseCase.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';


@injectable
class WorkerDashboardViewModel extends Cubit<WorkerDashboardState> {

  WorkerProfileUseCase workerProfileUseCase ;
  PendingOrdersUseCase pendingOrdersUseCase;


  WorkerDashboardViewModel(this.workerProfileUseCase ,this.pendingOrdersUseCase) :super(WorkerDashboardLoading("Loading..."));


  void GetDashboard(String workerID) async {
    emit(WorkerDashboardLoading("Loading..."));

    try {
      ServiceProviderProfileData Profile = await workerProfileUseCase.invoke(workerID);
      WorkerOrdersListResponse requestedOrders = await pendingOrdersUseCase.invoke(workerID);
      emit(WorkerDashboardSuccess(Profile.payload , requestedOrders.payload));
    }
    catch (e) {
      emit(WorkerDashboardError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class WorkerDashboardState {}

class WorkerDashboardSuccess extends WorkerDashboardState {

  WorkerPersonalDetails? profile;
  List<OutSidePayload>? orders;


  WorkerDashboardSuccess(this.profile, this.orders);

}

class WorkerDashboardLoading extends WorkerDashboardState {
  String message;

  WorkerDashboardLoading(this.message);
}

class WorkerDashboardError extends WorkerDashboardState {
  String message;

  WorkerDashboardError(this.message);
}