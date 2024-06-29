
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class DisableDistrictUseCase {

  AdminRepository adminRepository;
  @factoryMethod DisableDistrictUseCase(this.adminRepository);

  Future<dynamic> invoke(String? providerID, String? districtID) {
    print("invoking Disable District UseCase ");
    return adminRepository.DisableDistrict(providerID, districtID);
  }
}