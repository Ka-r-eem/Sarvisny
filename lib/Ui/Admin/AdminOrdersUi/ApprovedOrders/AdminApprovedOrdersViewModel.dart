import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getApprovedOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminApprovedOrdersViewModel extends Cubit<ApprovedOrdersState> {

  getApprovedOrdersUseCase? showApprovedOrdersUseCase  ;

  AdminApprovedOrdersViewModel(this.showApprovedOrdersUseCase) :super(OrdersListLoading("Loading..."));


  void GetOrdersList() async {
  emit(OrdersListLoading("Loading..."));

  try {
    var customers = await showApprovedOrdersUseCase?.invoke();
    emit(OrdersListSuccess(customers));
  }
  catch (e) {
    emit(OrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class ApprovedOrdersState {}

class OrdersListSuccess extends ApprovedOrdersState {

  List<OrderResponse>? OrdersList;

  OrdersListSuccess(this.OrdersList);

}

class OrdersListLoading extends ApprovedOrdersState {
  String message;

  OrdersListLoading(this.message);
}

class OrdersListError extends ApprovedOrdersState {
  String message;

  OrdersListError(this.message);
}