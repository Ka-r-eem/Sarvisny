import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class CancelUseCase {

  CustomerRepository customerRepository;
  @factoryMethod CancelUseCase(this.customerRepository);

  Future<dynamic> invoke(String? orderId , String? customerId){
    print("invoking Cancel Order UseCase ");
    return customerRepository.CustomerCancelOrder(orderId, customerId);
  }
}