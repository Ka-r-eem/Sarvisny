
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ServicesListResponse.dart';

@injectable
class ShowServicesUseCase {

  AdminRepository adminRepository;
  @factoryMethod ShowServicesUseCase(this.adminRepository);

  Future<List<ServiceObject>?> invoke(){
    print("invoking");
    return adminRepository.AdminGetServices();
  }
}