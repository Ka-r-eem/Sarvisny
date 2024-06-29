import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetServiceWorkersUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetServiceWorkersUseCase(this.customerRepository);

  Future<dynamic> invoke (serviceID) async{
    print("invoking Get Workers UseCase ");
    print("service ID $serviceID");
    var workers = await customerRepository.GetServiceWorkers(serviceID);
    return workers.payload;
  }
}