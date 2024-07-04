import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetOrderUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetOrderUseCase(this.customerRepository);

  Future<dynamic> invoke(String customerID){
    print("invoking Get Orders UseCase ");
    var invoke =  customerRepository.GetCustomerOrders(customerID);
    print("use case : $invoke");
    return invoke;
  }
}