
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
@injectable
class AddServiceToCriteriaUseCase {

  AdminRepository adminRepository;
  @factoryMethod AddServiceToCriteriaUseCase(this.adminRepository);

  Future<dynamic> invoke(CriteriaID, ServiceID){
    return adminRepository.AddServiceToCriteria(CriteriaID, ServiceID);
  }
}