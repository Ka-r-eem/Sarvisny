
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class EnableDistrictUseCase {

  AdminRepository adminRepository;
  @factoryMethod EnableDistrictUseCase(this.adminRepository);

  Future<dynamic> invoke(String? providerID, String? districtID) {
    print("invoking Enable District UseCase ");
    return adminRepository.EnableDistrict(providerID, districtID);
  }
}