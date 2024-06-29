import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/model/WorkerRelatedResponse/WorkerOrdersListResponse.dart';
import '../../../domain/UseCases/WorkerUseCases/GetRegisteredServicesUseCase.dart';
import '../../../domain/model/WorkerRelatedResponse/WorkerRegisteredServicesResponse.dart';

@injectable
class WorkerServicesListViewModel extends Cubit<WorkerServicesListState> {

  GetRegisteredServicesUseCase getRegisteredServicesUseCase ;


  WorkerServicesListViewModel(this.getRegisteredServicesUseCase) :super(WorkerServicesListLoading("Loading..."));


  void GetRegisteredServices(String workerID) async {
    emit(WorkerServicesListLoading("Loading..."));

    try {
      WorkerRegisteredServicesResponse services = await getRegisteredServicesUseCase.invoke(workerID);
      emit(WorkerServicesListSuccess(services.payload));
    }
    catch (e) {
      emit(WorkerServicesListError(e.toString()));
      print("in the catch $e");
    }
  }}


sealed class WorkerServicesListState {}

class WorkerServicesListSuccess extends WorkerServicesListState {

  List<RegisteredService>? services;

  WorkerServicesListSuccess(this.services);

}

class WorkerServicesListLoading extends WorkerServicesListState {
  String message;

  WorkerServicesListLoading(this.message);
}

class WorkerServicesListError extends WorkerServicesListState {
  String message;

  WorkerServicesListError(this.message);
}