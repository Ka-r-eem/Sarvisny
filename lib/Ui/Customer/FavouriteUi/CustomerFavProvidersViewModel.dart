import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/CustomerUseCases/GetCustomerFavsUseCase.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCustomerFavResponse.dart';
import '../../../domain/UseCases/CustomerUseCases/GetProfileUseCase.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';


@injectable
class CustomerFavProvidersViewModel extends Cubit<CustomerFavProvidersState> {

  GetCustomerFavsUseCase getCustomerFavsUseCase ;


  CustomerFavProvidersViewModel(this.getCustomerFavsUseCase) :super(CustomerFavProvidersLoading("Loading..."));


  void GetFavs(id) async {
    emit(CustomerFavProvidersLoading("Loading..."));

    try {
      GetCustomerFavResponse Favs = await getCustomerFavsUseCase.invoke(id);
      print(Favs.payload);
      if(Favs.payload != null || Favs.payload!.length == 0){
        emit(CustomerFavProvidersSuccess(Favs.payload));
      }
    }
    catch (e) {
      emit(CustomerFavProvidersError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class CustomerFavProvidersState {}

class CustomerFavProvidersSuccess extends CustomerFavProvidersState {

  List<FavProvider>? favList;

  CustomerFavProvidersSuccess(this.favList);

}

class CustomerFavProvidersLoading extends CustomerFavProvidersState {
  String message;

  CustomerFavProvidersLoading(this.message);
}

class CustomerFavProvidersError extends CustomerFavProvidersState {
  String message;

  CustomerFavProvidersError(this.message);
}