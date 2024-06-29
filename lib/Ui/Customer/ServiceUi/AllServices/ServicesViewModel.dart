import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/CustomerUseCases/GetServicesListUseCase.dart';
import '../../../../domain/model/CustomerRelatedResponses/CustomerServicesListResponse.dart';


@injectable
class ServicesViewModel extends Cubit<ServicesListState> {

  GetServicesListUseCase getServicesListUseCase ;

  ServicesViewModel(this.getServicesListUseCase) :super(ServicesListLoading("Loading..."));


  void GetServicesList() async {
    emit(ServicesListLoading("Loading..."));

    try {
      var Services = await getServicesListUseCase.invoke();
      emit(ServicesListSuccess(Services));
    }
    catch (e) {
      emit(ServicesListError(e.toString()));
      print("in the catch");
    }
  }}


sealed class ServicesListState {}

class ServicesListSuccess extends ServicesListState {

  CustomerServicesListResponse? services ;


  ServicesListSuccess(this.services);

}

class ServicesListLoading extends ServicesListState {
  String message;

  ServicesListLoading(this.message);
}

class ServicesListError extends ServicesListState {
  String message;

  ServicesListError(this.message);
}