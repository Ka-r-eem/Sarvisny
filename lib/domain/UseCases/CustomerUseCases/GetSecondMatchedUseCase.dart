import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class GetSecondMatchedUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetSecondMatchedUseCase(this.customerRepository);

  Future<dynamic> invoke(String serviceId, String day, String time, String districtId, String customerId){
    print("invoking Get Second Matched UseCase ");
    var invoke =  customerRepository.GetSecMatched(serviceId, day, time, districtId, customerId);
    return invoke;
  }
}