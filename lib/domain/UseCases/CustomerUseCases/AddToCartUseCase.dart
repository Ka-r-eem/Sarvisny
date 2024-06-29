import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class AddToCartUseCase {

  CustomerRepository customerRepository;
  @factoryMethod AddToCartUseCase(this.customerRepository);

  Future<dynamic> invoke(context, customerID, providerID, serviceID, slotID, des){
    print("invoking Add To Cart UseCase ");
    return customerRepository.AddToCart(context, customerID, providerID, serviceID, slotID, des);
  }
}