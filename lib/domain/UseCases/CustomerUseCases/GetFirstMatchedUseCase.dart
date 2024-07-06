import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetFirstMatchedUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetFirstMatchedUseCase(this.customerRepository);

  Future<dynamic> invoke(String serviceId, String day, String time, String districtId, String customerId){
    print("invoking Get First Matched UseCase ");
    var invoke =  customerRepository.GetFirstMatched(serviceId, day, time, districtId, customerId);
    return invoke;
  }
}