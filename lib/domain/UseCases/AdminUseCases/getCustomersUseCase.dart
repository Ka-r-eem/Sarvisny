
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/CustomerRelatedResponses/CustomersListResponse.dart';

@injectable
class getCustomersUseCase {

  AdminRepository adminRepository;
  @factoryMethod getCustomersUseCase(this.adminRepository);

  Future<List<CustomerListObject>?> invoke(){
    return adminRepository.AdminGetCustomers();
  }
}