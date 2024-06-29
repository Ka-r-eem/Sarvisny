import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getRequestedOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminPendingOrdersViewModel extends Cubit<PendingOrdersState> {

  getRequestedOrdersUseCase? showPendingOrdersUseCase  ;

  AdminPendingOrdersViewModel(this.showPendingOrdersUseCase) :super(OrdersListLoading("Loading..."));


  void GetOrdersList() async {
  emit(OrdersListLoading("Loading..."));

  try {
    var customers = await showPendingOrdersUseCase?.invoke();
    emit(OrdersListSuccess(customers));
  }
  catch (e) {
    emit(OrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class PendingOrdersState {}

class OrdersListSuccess extends PendingOrdersState {

  List<OrderResponse>? OrdersList;

  OrdersListSuccess(this.OrdersList);

}

class OrdersListLoading extends PendingOrdersState {
  String message;

  OrdersListLoading(this.message);
}

class OrdersListError extends PendingOrdersState {
  String message;

  OrdersListError(this.message);
}