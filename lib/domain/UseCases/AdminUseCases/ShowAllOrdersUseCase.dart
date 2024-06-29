
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';

@injectable
class ShowAllOrdersUseCase {

  AdminRepository adminRepository;
  @factoryMethod ShowAllOrdersUseCase(this.adminRepository);

  Future<List<OrderResponse>?> invoke(){
    return adminRepository.GetAllOrders();
  }
}