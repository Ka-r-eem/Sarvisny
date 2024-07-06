import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class AddProviderToFavUseCase {

  CustomerRepository customerRepository;
  @factoryMethod AddProviderToFavUseCase(this.customerRepository);

  Future<dynamic> invoke(String providerId , String customerId){
    print("invoking Add Provider To Fav UseCase ");
    return customerRepository.AddProviderToFav(providerId, customerId);
  }
}