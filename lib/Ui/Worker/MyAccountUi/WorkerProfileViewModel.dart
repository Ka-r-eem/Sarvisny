import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerProfileUseCase.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/WorkerSlotsUseCase.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ServiceProviderProfileData.dart';

import '../../../../domain/model/WorkerRelatedResponse/WorkerSlotsResponseData.dart';
import '../../../domain/UseCases/WorkerUseCases/GetWorkerImageUseCase.dart';
import '../../../domain/model/WorkerRelatedResponse/GetWorkerImageResponse.dart';


@injectable
class WorkerProfileViewModel extends Cubit<WorkerProfileState> {

  WorkerProfileUseCase workerProfileUseCase ;
  GetWorkerImageUseCase getWorkerImageUseCase;


  WorkerProfileViewModel(this.workerProfileUseCase , this.getWorkerImageUseCase) :super(WorkerProfileLoading("Loading..."));


  void GetProfile(String workerID) async {
    emit(WorkerProfileLoading("Loading..."));

    try {
      ServiceProviderProfileData Profile = await workerProfileUseCase.invoke(workerID);
      GetWorkerImageResponse Image = await getWorkerImageUseCase.invoke(workerID);
      emit(WorkerProfileSuccess(Profile.payload , Image.payload));
    }
    catch (e) {
      emit(WorkerProfileError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class WorkerProfileState {}

class WorkerProfileSuccess extends WorkerProfileState {

  WorkerPersonalDetails? profile;
  String? base64Image ;

  WorkerProfileSuccess(this.profile, this.base64Image);

}

class WorkerProfileLoading extends WorkerProfileState {
  String message;

  WorkerProfileLoading(this.message);
}

class WorkerProfileError extends WorkerProfileState {
  String message;

  WorkerProfileError(this.message);
}