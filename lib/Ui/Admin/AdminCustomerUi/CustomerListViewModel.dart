import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/UseCases/AdminUseCases/getCustomersUseCase.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomersListResponse.dart';


@injectable
class CustomerListViewModel extends Cubit<CustomerListState> {

  getCustomersUseCase? ShowCustomersUseCase ;

  CustomerListViewModel(this.ShowCustomersUseCase) :super(CustomerListLoading("Loading..."));


  void GetCustomersList() async {
  emit(CustomerListLoading("Loading..."));

  try {
    var customers = await ShowCustomersUseCase?.invoke();
    print(customers);
    emit(CustomerListSuccess(customers));
  }
  catch (e) {
    emit(CustomerListError(e.toString()));
    print("in the catch");
  }
}}


sealed class CustomerListState {}

class CustomerListSuccess extends CustomerListState {

  List<CustomerListObject>? CustomersList;

  CustomerListSuccess(this.CustomersList);

}

class CustomerListLoading extends CustomerListState {
  String message;

  CustomerListLoading(this.message);
}

class CustomerListError extends CustomerListState {
  String message;

  CustomerListError(this.message);
}