import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../domain/UseCases/AdminUseCases/getCancelledOrdersUseCase.dart';
import '../../../../domain/UseCases/AdminUseCases/getRejectedOrdersUseCase.dart';
import '../../../../domain/model/AdminRelatedResponses/OrdersResponse.dart';


@injectable
class AdminRejectedOrdersViewModel extends Cubit<RejectedOrdersState> {

  getRejectedOrdersUseCase? showRejectedOrdersUseCase;


  AdminRejectedOrdersViewModel(this.showRejectedOrdersUseCase) :super(RejectedOrdersListLoading("Loading..."));


  void GetRejectedOrdersList() async {
  emit(RejectedOrdersListLoading("Loading..."));

  try {
    var orders = await showRejectedOrdersUseCase?.invoke();
    emit(RejectedOrdersListSuccess(orders));
  }
  catch (e) {
    emit(RejectedOrdersListError(e.toString()));
    print("in the catch");
  }
}}


sealed class RejectedOrdersState {}

class RejectedOrdersListSuccess extends RejectedOrdersState {

  List<OrderResponse>? OrdersList;

  RejectedOrdersListSuccess(this.OrdersList);

}

class RejectedOrdersListLoading extends RejectedOrdersState {
  String message;

  RejectedOrdersListLoading(this.message);
}

class RejectedOrdersListError extends RejectedOrdersState {
  String message;

  RejectedOrdersListError(this.message);
}