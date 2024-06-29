import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getCancelledOrdersUseCase.dart';
import '../../../../domain/UseCases/AdminUseCases/getExpiredOrdersUseCase.dart';
import '../../../../domain/UseCases/AdminUseCases/getRejectedOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminExpiredOrdersViewModel extends Cubit<ExpiredOrdersState> {

  getExpiredOrdersUseCase? showExpiredOrdersUseCase;


  AdminExpiredOrdersViewModel(this.showExpiredOrdersUseCase) :super(ExpiredOrdersListLoading("Loading..."));


  void GetExpiredOrdersList() async {
  emit(ExpiredOrdersListLoading("Loading..."));

  try {
    var orders = await showExpiredOrdersUseCase?.invoke();
    emit(ExpiredOrdersListSuccess(orders));
  }
  catch (e) {
    emit(ExpiredOrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class ExpiredOrdersState {}

class ExpiredOrdersListSuccess extends ExpiredOrdersState {

  List<OrderResponse>? OrdersList;

  ExpiredOrdersListSuccess(this.OrdersList);

}

class ExpiredOrdersListLoading extends ExpiredOrdersState {
  String message;

  ExpiredOrdersListLoading(this.message);
}

class ExpiredOrdersListError extends ExpiredOrdersState {
  String message;

  ExpiredOrdersListError(this.message);
}