
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/OrdersResponse.dart';

@injectable
class getRejectedOrdersUseCase {

  AdminRepository adminRepository;
  @factoryMethod getRejectedOrdersUseCase(this.adminRepository);

  Future<List<OrderResponse>?> invoke(){
    return adminRepository.GetRejectedOrders();
  }
}