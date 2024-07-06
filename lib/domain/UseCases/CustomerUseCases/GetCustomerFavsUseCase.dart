import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

import '../../model/CustomerRelatedResponses/GetCustomerFavResponse.dart';

@injectable
class GetCustomerFavsUseCase {

  CustomerRepository customerRepository;
  @factoryMethod GetCustomerFavsUseCase(this.customerRepository);

  Future<dynamic> invoke(String customerId) async{
    print("invoking Get Favs UseCase ");
    GetCustomerFavResponse invoke =  await customerRepository.GetCustomerFav(customerId);
    print("use case : ${invoke.payload?.first.providerId}");
    return invoke;
  }
}