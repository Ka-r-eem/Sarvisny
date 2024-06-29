
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';

@injectable
class getRequestedOrdersUseCase {

  AdminRepository adminRepository;
  @factoryMethod getRequestedOrdersUseCase(this.adminRepository);

  Future<List<OrderResponse>?> invoke(){
    return adminRepository.GetRequestedOrders();
  }
}