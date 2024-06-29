import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomerProfileData.dart';

@injectable
class GetProfileUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetProfileUseCase(this.customerRepository);

  Future<CustomerProfileData> invoke(customerID){
    print("invoking Get Profile UseCase ");
    return customerRepository.GetCustomerProfile(customerID);
  }
}