
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';

@injectable
class AddCriteriaUseCase {

  AdminRepository adminRepository;
  @factoryMethod AddCriteriaUseCase(this.adminRepository);

  Future<dynamic> invoke(criteriaData){
    print("invoking Add Criteria UseCase ");
    return adminRepository.addCriteria(criteriaData);
  }
}