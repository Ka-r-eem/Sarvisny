import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/UseCases/WorkerUseCases/GetOrderDetailsUseCase.dart';
import 'package:sarvisny/domain/model/WorkerRelatedResponse/ShowOrderDetailsResponse.dart';

import '../../../../domain/UseCases/WorkerUseCases/GetOrderDetailsUseCase.dart';


@injectable
class OrderDetailsViewModel extends Cubit<OrderDetailsState> {

  GetOrderDetailsUseCase getOrderDetailsUseCase ;


  OrderDetailsViewModel(this.getOrderDetailsUseCase) :super(OrderDetailsLoading("Loading..."));


  void GetOrderDetails(String orderID) async {
    emit(OrderDetailsLoading("Loading..."));

    try {
      ShowOrderDetailsResponse orders = await getOrderDetailsUseCase.invoke(orderID);
      emit(OrderDetailsSuccess(orders.payload));
    }
    catch (e) {
      emit(OrderDetailsError(e.toString()));
      print("in the catch$e");
    }
  }}


sealed class OrderDetailsState {}

class OrderDetailsSuccess extends OrderDetailsState {

 orderDetails? order;

  OrderDetailsSuccess(this.order);

}

class OrderDetailsLoading extends OrderDetailsState {
  String message;

  OrderDetailsLoading(this.message);
}

class OrderDetailsError extends OrderDetailsState {
  String message;

  OrderDetailsError(this.message);
}