
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class AddDistrictUseCase {

  AdminRepository adminRepository;
  @factoryMethod AddDistrictUseCase(this.adminRepository);

  Future<dynamic> invoke(districtName) {
    print("invoking Add District UseCase ");
    return adminRepository.AddDistrict(districtName);
  }
}