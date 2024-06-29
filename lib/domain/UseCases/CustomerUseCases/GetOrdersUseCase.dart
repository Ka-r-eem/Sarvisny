import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetOrderUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetOrderUseCase(this.customerRepository);

  Future<dynamic> invoke(String customerID){
    print("invoking Get Orders UseCase ");
    return customerRepository.GetCustomerOrders(customerID);
  }
}