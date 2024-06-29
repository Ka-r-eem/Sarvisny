import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetServicesListUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetServicesListUseCase(this.customerRepository);

  Future<dynamic> invoke(){
    print("invoking Get Services UseCase ");
    return customerRepository.GetServicesList();
  }
}