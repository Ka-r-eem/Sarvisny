
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/ParentsServicesResponse.dart';

@injectable
class GetParentsUseCase {

  AdminRepository adminRepository;
  @factoryMethod GetParentsUseCase(this.adminRepository);

  Future<ParentsServicesResponse> invoke() {
    print("invoking GET Parents UseCase ");
    return adminRepository.GetParents();
  }
}