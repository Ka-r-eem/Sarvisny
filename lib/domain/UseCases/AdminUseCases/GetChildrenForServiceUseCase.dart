
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

@injectable
class GetChildrenUseCase {

  AdminRepository adminRepository;
  @factoryMethod GetChildrenUseCase(this.adminRepository);

  Future<ChildrenServicesResponse> invoke(String? serviceID) {
    print("invoking GET Children UseCase ");
    return adminRepository.GetChildren(serviceID);
  }
}