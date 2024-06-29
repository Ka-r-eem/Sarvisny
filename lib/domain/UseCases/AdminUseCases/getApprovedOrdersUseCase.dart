
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';

@injectable
class getApprovedOrdersUseCase {

  AdminRepository adminRepository;
  @factoryMethod getApprovedOrdersUseCase(this.adminRepository);

  Future<List<OrderResponse>?> invoke(){
    return adminRepository.GetApprovedOrders();
  }
}