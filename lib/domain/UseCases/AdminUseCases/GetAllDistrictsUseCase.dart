
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/GetDistrictsData.dart';

@injectable
class GetAllDistrictsUseCase {

  AdminRepository adminRepository;
  @factoryMethod GetAllDistrictsUseCase(this.adminRepository);

  Future<GetDistrictsData> invoke() {
    print("invoking GET All Districts UseCase ");
    return adminRepository.GetAllDistricts();
  }
}