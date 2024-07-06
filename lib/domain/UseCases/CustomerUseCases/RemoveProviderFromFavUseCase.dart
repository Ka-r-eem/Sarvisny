import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class RemoveProviderFromFavUseCase {

  CustomerRepository customerRepository;
  @factoryMethod RemoveProviderFromFavUseCase(this.customerRepository);

  Future<dynamic> invoke(String providerId , String customerId){
    print("invoking Remove Provider From Fav UseCase ");
    return customerRepository.RemoveProviderFromFav(providerId, customerId);
  }
}