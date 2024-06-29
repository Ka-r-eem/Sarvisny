import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/UseCases/CustomerUseCases/GetOrdersUseCase.dart';
import '../../../domain/UseCases/CustomerUseCases/GetProfileUseCase.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerOrdersLogResponse.dart';
import '../../../domain/model/CustomerRelatedResponses/CustomerProfileData.dart';


@injectable
class OrderListViewModel extends Cubit<OrdersListState> {

  GetOrderUseCase getOrdersUSeCase ;


  OrderListViewModel(this.getOrdersUSeCase) :super(OrdersListLoading("Loading..."));


  void GetOrders(id) async {
    emit(OrdersListLoading("Loading..."));

    try {
      var Orders = await getOrdersUSeCase.invoke(id);
      emit(OrdersListSuccess(Orders));
    }
    catch (e) {
      emit(OrdersListError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class OrdersListState {}

class OrdersListSuccess extends OrdersListState {

  List<CustomerOrderPayload?> orders;

  OrdersListSuccess(this.orders);

}

class OrdersListLoading extends OrdersListState {
  String message;

  OrdersListLoading(this.message);
}

class OrdersListError extends OrdersListState {
  String message;

  OrdersListError(this.message);
}