import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/UseCases/AdminUseCases/ShowAllOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminAllOrdersViewModel extends Cubit<AllOrdersState> {

  ShowAllOrdersUseCase? showAllOrdersUseCase ;

  AdminAllOrdersViewModel(this.showAllOrdersUseCase) :super(OrdersListLoading("Loading..."));


  void GetOrdersList() async {
  emit(OrdersListLoading("Loading..."));

  try {
    var customers = await showAllOrdersUseCase?.invoke();
    emit(OrdersListSuccess(customers));
  }
  catch (e) {
    emit(OrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class AllOrdersState {}

class OrdersListSuccess extends AllOrdersState {

  List<OrderResponse>? OrdersList;

  OrdersListSuccess(this.OrdersList);

}

class OrdersListLoading extends AllOrdersState {
  String message;

  OrdersListLoading(this.message);
}

class OrdersListError extends AllOrdersState {
  String message;

  OrdersListError(this.message);
}