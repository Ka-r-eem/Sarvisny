
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/childrenServicesResponse.dart';

@injectable
class GetChildrenUseCase {

  AdminRepository adminRepository;
  @factoryMethod GetChildrenUseCase(this.adminRepository);

  Future<ChildrenServicesResponse> invoke(String? serviceID)async {
    print("invoking GET Children UseCase ");
    var children = await adminRepository.GetChildren(serviceID);
    print("Inside the useCase");
    print(children);
    return children;
  }
}