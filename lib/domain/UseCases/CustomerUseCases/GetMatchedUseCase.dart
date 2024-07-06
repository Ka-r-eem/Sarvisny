import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetMatchedUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetMatchedUseCase(this.customerRepository);

  Future<dynamic> invoke(String serviceId, String day, String time, String districtId, String customerId){
    print("invoking Get Matched UseCase ");
    var invoke =  customerRepository.GetAllMatched(serviceId, day, time, districtId, customerId);
    return invoke;
  }
}