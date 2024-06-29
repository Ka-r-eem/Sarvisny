
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class AddWorkerToDistrictUseCase {

  AdminRepository adminRepository;
  @factoryMethod AddWorkerToDistrictUseCase(this.adminRepository);

  Future<dynamic> invoke(String? providerID, String? districtID) {
    print("invoking Add Worker to District UseCase ");
    return adminRepository.AddWorkerToDistrict(providerID, districtID);
  }
}