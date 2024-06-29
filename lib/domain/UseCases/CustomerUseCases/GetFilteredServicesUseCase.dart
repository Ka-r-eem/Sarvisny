import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetFilteredServicesUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetFilteredServicesUseCase(this.customerRepository);

  Future<dynamic> invoke(CriteriaId) async{
    print(CriteriaId);
    print("invoking Get filtered UseCase ");
    var services = await customerRepository.GetFilteredServices(CriteriaId);
    return services;
  }
}