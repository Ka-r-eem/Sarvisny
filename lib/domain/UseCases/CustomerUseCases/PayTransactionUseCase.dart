import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/CustomerRepository.dart';

@injectable
class PayTransactionUseCase {

  CustomerRepository customerRepository;
  @factoryMethod PayTransactionUseCase(this.customerRepository);

  Future<dynamic> invoke(trasnID){
    print("invoking Pay Transaction UseCase ");
    return customerRepository.PayTransaction(trasnID);
  }
}