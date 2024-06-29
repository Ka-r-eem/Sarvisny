
import 'package:injectable/injectable.dart';
import 'package:sarvisny/domain/RepositoryContract/AdminRepository.dart';
import 'package:sarvisny/domain/model/AdminRelatedResponses/CriteriasListResponse.dart';

@injectable
class ShowAllCriteriasUseCase {

  AdminRepository adminRepository;
  @factoryMethod ShowAllCriteriasUseCase(this.adminRepository);

  Future<List<CriteriaObject>?> invoke(){
    return adminRepository.GetAllCriterai();
  }
}