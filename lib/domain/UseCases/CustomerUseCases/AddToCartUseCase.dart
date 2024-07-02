import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class AddToCartUseCase {

  CustomerRepository customerRepository;
  @factoryMethod AddToCartUseCase(this.customerRepository);

  Future<dynamic> invoke(context, customerID, providerID, List<String>? serviceIDs, slotID, districtID , address,des, String? requestDay) {
    print("invoking Add To Cart UseCase ");
    return customerRepository.AddToCart(context, customerID, providerID, serviceIDs, slotID,districtID,address, des , requestDay);
  }
}