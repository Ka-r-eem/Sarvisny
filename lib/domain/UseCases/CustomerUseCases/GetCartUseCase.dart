import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetCartUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetCartUseCase(this.customerRepository);

  Future<dynamic> invoke(String id){
    print("invoking Get Cart UseCase ");
    return customerRepository.GetCart(id);
  }
}