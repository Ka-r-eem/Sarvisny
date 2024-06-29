import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class RemoveFromCartUseCase {

  CustomerRepository customerRepository;
  @factoryMethod RemoveFromCartUseCase(this.customerRepository);

  Future<dynamic> invoke(String customerID , String RequestID){
    print("invoking Remove From Cart UseCase ");
    return customerRepository.RemoveFromCart(customerID, RequestID);
  }
}