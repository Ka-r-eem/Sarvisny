import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/UseCases/CustomerUseCases/GetProfileUseCase.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';


@injectable
class CustomerProfileViewModel extends Cubit<CustomerProfileState> {

  GetProfileUseCase getProfileUseCase ;


  CustomerProfileViewModel(this.getProfileUseCase) :super(CustomerProfileLoading("Loading..."));


  void GetProfile(id) async {
    emit(CustomerProfileLoading("Loading..."));

    try {
      var Profile = await getProfileUseCase.invoke(id);
      emit(CustomerProfileSuccess(Profile));
    }
    catch (e) {
      emit(CustomerProfileError(e.toString()));
      print("in the catch");
    }
  }}


sealed class CustomerProfileState {}

class CustomerProfileSuccess extends CustomerProfileState {

  CustomerProfileData profileData;

  CustomerProfileSuccess(this.profileData);

}

class CustomerProfileLoading extends CustomerProfileState {
  String message;

  CustomerProfileLoading(this.message);
}

class CustomerProfileError extends CustomerProfileState {
  String message;

  CustomerProfileError(this.message);
}