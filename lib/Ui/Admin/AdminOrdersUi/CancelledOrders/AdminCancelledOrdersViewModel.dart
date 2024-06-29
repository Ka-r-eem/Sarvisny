import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getCancelledOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminCancelledOrdersViewModel extends Cubit<CancelledOrdersState> {

  getCancelledOrdersUseCase? showCancelledOrdersUseCase;


  AdminCancelledOrdersViewModel(this.showCancelledOrdersUseCase) :super(CancelledOrdersListLoading("Loading..."));


  void GetCancelledOrdersList() async {
  emit(CancelledOrdersListLoading("Loading..."));

  try {
    var orders = await showCancelledOrdersUseCase?.invoke();
    emit(CancelledOrdersListSuccess(orders));
  }
  catch (e) {
    emit(CancelledOrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class CancelledOrdersState {}

class CancelledOrdersListSuccess extends CancelledOrdersState {

  List<OrderResponse>? OrdersList;

  CancelledOrdersListSuccess(this.OrdersList);

}

class CancelledOrdersListLoading extends CancelledOrdersState {
  String message;

  CancelledOrdersListLoading(this.message);
}

class CancelledOrdersListError extends CancelledOrdersState {
  String message;

  CancelledOrdersListError(this.message);
}