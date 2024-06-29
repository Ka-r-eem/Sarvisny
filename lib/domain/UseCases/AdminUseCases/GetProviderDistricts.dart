
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class GetProviderDistrictsUseCase {

  AdminRepository adminRepository;
  @factoryMethod GetProviderDistrictsUseCase(this.adminRepository);

  Future<dynamic> invoke(String? providerID) {
    print("invoking get Provider Districts UseCase ");
    return adminRepository.getProviderDistricts(providerID);
  }
}