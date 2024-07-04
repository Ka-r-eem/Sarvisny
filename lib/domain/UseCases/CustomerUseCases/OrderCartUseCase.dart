import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class OrderCartUseCase {

  CustomerRepository customerRepository;
  @factoryMethod OrderCartUseCase(this.customerRepository);

  Future<dynamic> invoke(customerID , paymentmethod){
    print("invoking Order Cart UseCase ");
    return customerRepository.OrderCart(customerID , paymentmethod);
  }
}