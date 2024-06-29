import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/GetCartResponse.dart';
import '../../../domain/UseCases/CustomerUseCases/GetCartUseCase.dart';
import '../../../domain/UseCases/CustomerUseCases/OrderCartUseCase.dart';
import '../../../domain/UseCases/CustomerUseCases/RemoveFromCartUseCase.dart';


@injectable
class MyCartViewModel extends Cubit<CartItemsState> {

  GetCartUseCase getCartUseCase ;
  RemoveFromCartUseCase removeFromCartUseCase;
  OrderCartUseCase orderCartUseCase;


  MyCartViewModel(this.orderCartUseCase,this.removeFromCartUseCase,this.getCartUseCase) :super(CartItemsLoading("Loading..."));


  void GetCartItems(id) async {
    emit(CartItemsLoading("Loading..."));

    try {
      var Cart = await getCartUseCase.invoke(id);
      emit(CartItemsSuccess(Cart));
    }
    catch (e) {
      emit(CartItemsError(e.toString()));
      print("in the catch");
    }
  }}


sealed class CartItemsState {}

class CartItemsSuccess extends CartItemsState {

  GetCartResponse Cart ;

  CartItemsSuccess(this.Cart);

}

class CartItemsLoading extends CartItemsState {
  String message;

  CartItemsLoading(this.message);
}

class CartItemsError extends CartItemsState {
  String message;

  CartItemsError(this.message);
}