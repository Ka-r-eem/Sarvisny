import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class CustomerRegisterUseCase {

  CustomerRepository customerRepository;
  @factoryMethod CustomerRegisterUseCase(this.customerRepository);

  Future<dynamic> invoke(data){
    print("invoking Customer Register UseCase ");
    return customerRepository.customerRegistration(data);
  }
}